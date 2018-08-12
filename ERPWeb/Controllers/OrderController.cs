using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ERPWeb.Core.Domain;
using ERPWeb.Core.Dto;
using ERPWeb.Core.Repository;
using ERPWeb.Core.Validators;
using MyFX.Core.Actions;
using MyFX.Core.Base;
using MyFX.Core.BaseModel.Result;
using MyFX.Core.Domain.Uow;

namespace ERPWeb.Controllers
{
    public class OrderController : Controller
    {
        private readonly IUnitOfWork _uow;
        private readonly IOrderRepository _orderRepository;

        public OrderController(IOrderRepository orderRepository, IUnitOfWork uow)
        {
            _uow = uow;
            _orderRepository = orderRepository;
        }

        public ActionResult Index()
        {
            var rs = SafeOptionHelper.Execute(() =>
            {
                var order = _orderRepository.Single(o => o.OrderNo == "11122233344455888");
                return new ResultObject<Order>(order);
            });

            return Content(rs.ToJsonString(), "application/json");
        }

        public ActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Save(AddOrderRequest request)
        {
            var rs = SafeOptionHelper.Execute(request,new AddOrderValidator(), () =>
            {
                var order = new Order();
                order.OrderNo = request.OrderNo;
                order.CustomerId = request.CustomerId;
                order.OrderStatus = 20;
                order.OrderType = 10;
                order.StoreId = 123;
                order.StoreOwnerId = 888;

                _orderRepository.Add(order);
                _uow.Commit();
                return ResultObject.Success();
            });

            return Content(rs.ToJsonString(), "application/json");
        }
    }
}