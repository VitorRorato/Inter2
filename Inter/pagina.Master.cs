using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inter
{
    public partial class pagina : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
                Response.Redirect("default.aspx");
            else
                lblUsuario.Text = "Olá " + Session["usuario"].ToString() + " !";

            /*if (Session["usuario"] != null)
            {
                string usuariologado = (string)Session["usuariologado"];
                lblUsuario.Text=usuariologado;
            }
            else
            {
                Response.Redirect("default.aspx");
            }*/

        }

        protected void btnSair_Click1(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("default.aspx");
        }
    }
}