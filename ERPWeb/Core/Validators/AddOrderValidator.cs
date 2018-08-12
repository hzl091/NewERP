using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ERPWeb.Core.Dto;
using FluentValidation;

namespace ERPWeb.Core.Validators
{
    public class AddOrderValidator : EntityValidatorBase<AddOrderRequest>
    {
        public override void SetValidateRules()
        {
            RuleFor(o => o.OrderNo).NotEmpty().WithMessage("订单号不能为空");
            RuleFor(o => o.StoreId).GreaterThan(0).WithMessage("店铺id必须大于0");
            RuleFor(o => o.CustomerId).GreaterThan(0).WithMessage("客户id必须大于0");
            RuleFor(o => o.StoreOwnerId).GreaterThan(0).WithMessage("店主id必须大于0");
        }
    }
}