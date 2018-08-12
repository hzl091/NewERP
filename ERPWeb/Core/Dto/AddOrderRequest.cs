using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyFX.Core.BaseModel.Request;

namespace ERPWeb.Core.Dto
{
    public class AddOrderRequest : RequestBase
    {
        public string OrderNo { get; set; }

        /// <summary>
        /// 店铺Id
        /// </summary>
        public long StoreId { get; set; }

        /// <summary>
        /// 店主Id
        /// </summary>
        public long StoreOwnerId { get; set; }

        /// <summary>
        /// 买家Id
        /// </summary>
        public long CustomerId { get; set; }
    }
}