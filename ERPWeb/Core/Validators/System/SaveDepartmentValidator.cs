using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ERPWeb.Core.Dto.System;
using FluentValidation;

namespace ERPWeb.Core.Validators.System
{
    public class SaveDepartmentValidator : EntityValidatorBase<SaveDepartmentRequest>
    {
        public override void SetValidateRules()
        {
            RuleFor(r => r.Data.Name).NotEmpty().WithMessage("部门名字不能为空");
            RuleFor(r => r.Data.Remark).NotEmpty().WithMessage("部门备注不能为空");
        }
    }
}