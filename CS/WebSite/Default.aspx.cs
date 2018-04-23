using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void cb_Init(object sender, EventArgs e)
    {
        ASPxComboBox combo = sender as ASPxComboBox;
        GridViewDataItemTemplateContainer container = combo.NamingContainer as GridViewDataItemTemplateContainer;

        combo.ClientSideEvents.ValueChanged = String.Format("function (s, e) {{ OnValueChanged(s, e, {0}); }}", container.VisibleIndex);
    }
}
