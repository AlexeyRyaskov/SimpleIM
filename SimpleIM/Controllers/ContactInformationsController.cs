using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SimpleIM.Data;

namespace SimpleIM.Controllers
{
    public class ContactInformationsController : Controller
    {
        private Entities db = new Entities();

        // GET: ContactInformations
        // int id - Employee.Id
        public ActionResult Index(int? id)
        {
            IQueryable<ContactInformation> cil = null;
            Employee employees = null;

            // find Employee by Id in EmployeesSet
            if (id != null)
            {
                employees = db.EmployeeSet.Find(id);

            }

            if (employees != null)
            {
                return View(employees.ContactInformation); 
            }
            else
            {
                return View(db.ContactInformationSet.ToList());
            }

        }

        // GET: ContactInformations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ContactInformation contactInformation = db.ContactInformationSet.Find(id);
            if (contactInformation == null)
            {
                return HttpNotFound();
            }
            return View(contactInformation);
        }

        // GET: ContactInformations/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ContactInformations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Type,Value")] ContactInformation contactInformation)
        {
            if (ModelState.IsValid)
            {
                db.ContactInformationSet.Add(contactInformation);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(contactInformation);
        }

        // GET: ContactInformations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ContactInformation contactInformation = db.ContactInformationSet.Find(id);
            if (contactInformation == null)
            {
                return HttpNotFound();
            }
            return View(contactInformation);
        }

        // POST: ContactInformations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Type,Value")] ContactInformation contactInformation)
        {
            if (ModelState.IsValid)
            {
                db.Entry(contactInformation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(contactInformation);
        }

        // GET: ContactInformations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ContactInformation contactInformation = db.ContactInformationSet.Find(id);
            if (contactInformation == null)
            {
                return HttpNotFound();
            }
            return View(contactInformation);
        }

        // POST: ContactInformations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ContactInformation contactInformation = db.ContactInformationSet.Find(id);
            db.ContactInformationSet.Remove(contactInformation);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
