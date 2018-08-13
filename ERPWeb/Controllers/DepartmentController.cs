using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml.Serialization;
using ERPWeb.Core.Common;
using ERPWeb.Core.Domain.System;
using MyFX.Core.Actions;
using ERPWeb.Core.Dto.System;
using ERPWeb.Core.Repository.System;
using ERPWeb.Core.Validators.System;
using MyFX.Core;
using MyFX.Core.Base;
using MyFX.Core.BaseModel.Result;
using MyFX.Core.Domain.Uow;

namespace ERPWeb.Controllers
{
    public class DepartmentController : Controller
    {
        private readonly IDepartmentRepository _departmentRepository;
        private readonly IUnitOfWork _uow;
        public DepartmentController(IDepartmentRepository departmentRepository, IUnitOfWork uow)
        {
            _departmentRepository = departmentRepository;
            _uow = uow;
        }

        //
        // GET: /Department/
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult NewDep()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Save(SaveDepartmentRequest request)
        {
            var rs = SafeOptionHelper.Execute(request, new SaveDepartmentValidator(), () =>
            {
                var data = request.Data;
                if (request.OptionType == OptionType.Add)
                {
                    _departmentRepository.Add(new Department
                    {
                        Name = data.Name,
                        ParentId = data.ParentId,
                        Remark = data.Remark
                    });
                    _departmentRepository.Save();
                    _uow.Commit();
                    return ResultObject.Success();
                } 

                if (request.OptionType == OptionType.Edit)
                {
                    var dep = _departmentRepository.GetByKey(data.Id);
                    if (dep == null)
                    {
                        throw new Exception("部门信息未找到");
                    }

                    dep.Name = data.Name;
                    dep.ParentId = data.ParentId;
                    dep.Remark = data.Remark;
                    _uow.Commit();
                    return ResultObject.Success();
                }
                return ResultObject.Fail(500, "不支持的操作类型");
            });

            return Json(rs);
        }
    }
}