using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Services;

public partial class Logout : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
     //NOTE: Stopping IE from being a caching whore
        Session.Clear();
        Session.Abandon();
        Session.RemoveAll();
        HttpContext.Current.Response.Cache.SetAllowResponseInBrowserHistory(false);
        HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        HttpContext.Current.Response.Cache.SetNoStore();
        Response.Cache.SetExpires(DateTime.Now);
        Response.Cache.SetValidUntilExpires(true);
        Response.Redirect("index.aspx");
    }

    [WebMethod]
    public static int LogoutCheck()
    {
        if (HttpContext.Current.Session["user"] == null)
        {
            return 0;
        }
        return 1;
    }

}
