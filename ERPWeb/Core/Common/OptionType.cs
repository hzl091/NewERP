using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ERPWeb.Core.Common
{
    /// <summary>
    /// 操作类型
    /// </summary>
    public enum OptionType
    {
        /// <summary>
        /// 添加
        /// </summary>
        Add = 0,

        /// <summary>
        /// 编辑
        /// </summary>
        Edit = 1,

        /// <summary>
        /// 删除
        /// </summary>
        Delete = 3,

        /// <summary>
        /// 查看
        /// </summary>
        View = 4
    }
}