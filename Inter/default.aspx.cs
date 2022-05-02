using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inter
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("cadastro.aspx");
        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities();
            LOGIN login = new LOGIN();
            if (string.IsNullOrEmpty(txtUsuario.Text))
            {
                txtUsuario.Focus();
                return;
                
            }
            if (string.IsNullOrEmpty(txtSenha.Text))
            {
                txtSenha.Focus();
                return;
            }

            string user = txtUsuario.Text;
            string password = txtSenha.Text;


            login = conexao.LOGIN.FirstOrDefault(
                linha => linha.USUARIO.Equals(user) && linha.SENHA.Equals(password)
                );

            if (login != null)
            {
                Session["usuario"] = login.USUARIO;
                Response.Redirect("principal.aspx");
            }


        }
    }
}