using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyFX.Core.BaseModel.Request;

namespace ERPWeb.Core.Common
{
    public abstract class OptionRequest<T> : RequestBase
    {
        public OptionType OptionType { get; set; }

        public T Data { get; set; }
    }
}