// Run from root!
//Скрипт через web API получает данные, проверяет есть ли такой email уже в файле адресов postfix и если нет,
//то добавляет в него.
//API web server listen on http://server:1337/api

var express = require('express');
var path = require('path'); // модуль для парсинга пути
var app = express();
var sys = require('util')
var exec = require('child_process').exec;
var fs = require('fs');
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

var server = '@rh'
var user = 'il'
var cmd1 = 'ps'
var recipients = "./recipients"
var url = "http://simpleim.satel.local/api/values/102";
var arrRecipients = [];
var result = false;
var empl = [];

function puts(error, stdout, stderr) {console.log(stdout)}

function run (cmd) {
  //for remote server
	// exec('ssh ' + user + server + ' ' + cmd, puts);

  //for local install
  exec(cmd, puts);
}

//Store file recipients to array
function fileRead() {
    arrRecipients = fs.readFileSync(recipients).toString().split("\n");
    for (i in arrRecipients) {
      arrRecipients[i] = arrRecipients[i].substr(0, arrRecipients[i].indexOf(' '));
    }
};

//Apply changes on server
function makeChanges() {
    fileRead();
    for (i = 0; i < empl.length; i++) {
        var name = empl[i].data.fullName;
        var email = empl[i].data.email;
        if (arrRecipients.indexOf(email) == -1) {
          run('echo ' + email + '\t\\#' + name + ' >> ' + recipients)
          updatePostfix();
          console.log('Дописали: ' + email);
          result = true;
        } else {
          console.log('Уже есть: ' + email);
          result = false;
        }
    }
};

//Загружаем, пасим JSON c web API
function loadEmpl() {

    var xhr = new XMLHttpRequest();
    xhr.open('GET', url, true);
    xhr.send();
    xhr.onreadystatechange = function() {
        if (xhr.readyState != 4) return;
        if (xhr.status != 200) {
        // обработать ошибку
            console.log( xhr.status + ': ' + xhr.statusText );
            return;
        } else {
            try {
                empl = JSON.parse(xhr.responseText);
                makeChanges();
            } catch (e) {
                console.log( "Некорректный ответ " + e.message );
            }
        }
    }
};

// Обновить базу postfix из файла
function updatePostfix() {
    // run('postmap ' + recipients)
};

//API module
app.get('/api', function (req, res) {
    loadEmpl();
    res.send('Запустилось успешно');
    // var check = loadEmpl();
    // // console.log(check);
    // if (check) {
    //     res.send('Запустилось успешно');
    // } else {
    //     res.send('Ошибка');
    // }
});

app.listen(1337, function(){
    console.log('Express server listening on port 1337');
});
