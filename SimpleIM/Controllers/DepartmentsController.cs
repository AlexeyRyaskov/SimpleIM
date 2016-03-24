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
    public class DepartmentsController : Controller
    {
        private Entities db = new Entities();
        private List<Department> DepListWO = new List<Department>();
        
        // GET: Departments
        public ActionResult Index()
        {
         
            //create 3rd level tree structure with recursion

            foreach (var first_level_items in db.DepartmentSet)
            {
                if ((first_level_items.ParentId == null) || (first_level_items.ParentId == 0))
                {
                    first_level_items.Level = 1;
                    DepListWO.Add(first_level_items);
                    foreach (var second_level_item in db.DepartmentSet)
                    {
                        if (second_level_item.ParentId == first_level_items.Id)
                        {
                            second_level_item.Level = 2;
                            DepListWO.Add(second_level_item);
                            foreach (var third_level_item in db.DepartmentSet)
                            {
                                if (third_level_item.ParentId == second_level_item.Id)
                                {
                                    third_level_item.Level = 3;
                                    DepListWO.Add(third_level_item);
                                }
                            }
                        }
                    }
                }		
            }
            

            //foreach (var item in db.DepartmentsSet)
            //{
            //    if ((item.ParentId != null) && (item.ParentId != 0))
            //    {
            //        Departments dep = db.DepartmentsSet.Find(item.ParentId);
            //        item.ParentName = dep.Name;
            //    }
            //}

            //return View(db.DepartmentsSet.ToList());
            return View(DepListWO);
        }

        // GET: Departments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Department departments = db.DepartmentSet.Find(id);
            if (departments == null)
            {
                return HttpNotFound();
            }
            return View(departments);
        }

        // GET: Departments/Create
        public ActionResult Create(int parent)
        {

            Department departments = new Department();
            departments.ParentId = parent;
            
            return View(departments);
        }

        // POST: Departments/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,ParentId,Name")] Department departments)
        {
            if (ModelState.IsValid)
            {
                db.DepartmentSet.Add(departments);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(departments);
        }

        // GET: Departments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Department departments = db.DepartmentSet.Find(id);
            if (departments == null)
            {
                return HttpNotFound();
            }
            return View(departments);
        }

        // POST: Departments/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,ParentId,Name")] Department departments)
        {
            if (ModelState.IsValid)
            {
                db.Entry(departments).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(departments);
        }

        // GET: Departments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Department departments = db.DepartmentSet.Find(id);
            if (departments == null)
            {
                return HttpNotFound();
            }
            return View(departments);
        }

        // POST: Departments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Department departments = db.DepartmentSet.Find(id);
            db.DepartmentSet.Remove(departments);
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
