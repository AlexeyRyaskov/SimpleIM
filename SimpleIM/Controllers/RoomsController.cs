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
    public class RoomsController : Controller
    {
        private Entities db = new Entities();

        // GET: Rooms
        public ActionResult Index()
        {
            return View(db.RoomSet.ToList());
        }

        // GET: Rooms/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Room rooms = db.RoomSet.Find(id);
            if (rooms == null)
            {
                return HttpNotFound();
            }
            return View(rooms);
        }

        // GET: Rooms/Create
        public ActionResult Create()
        {
            ViewData["LocList"] = new SelectList(db.LocationSet, "Id", "Name");
            return View();
        }

        // POST: Rooms/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create([Bind(Include = "Id, Name, Locations, SelectedLocation")] Room rooms)
        {
            if (ModelState.IsValid)
            {
                rooms.Locations = db.LocationSet.Find(rooms.SelectedLocation);
                db.RoomSet.Add(rooms);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewData["Loc"] = new SelectList(db.LocationSet, "Id", "Name");
            return View();
        }

        // GET: Rooms/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Room rooms = db.RoomSet.Find(id);
            if (rooms == null)
            {
                return HttpNotFound();
            }
            ViewData["LocList"] = new SelectList(db.LocationSet, "Id", "Name", rooms.Locations);
            return View(rooms);
        }

        // POST: Rooms/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id, Name, Locations, SelectedLocation")] Room rooms)
        {
            if (ModelState.IsValid)
            {
                rooms.Locations = db.LocationSet.Find(rooms.SelectedLocation);
                db.Entry(rooms).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewData["LocList"] = new SelectList(db.LocationSet, "Id", "Name", rooms.Locations);
            return View(rooms);
        }

        // GET: Rooms/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Room rooms = db.RoomSet.Find(id);
            if (rooms == null)
            {
                return HttpNotFound();
            }
            return View(rooms);
        }

        // POST: Rooms/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Room rooms = db.RoomSet.Find(id);
            db.RoomSet.Remove(rooms);
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
