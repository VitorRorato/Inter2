using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inter
{
    public partial class cadastro : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {

            using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
            {
                if((txtSenha.Text == string.Empty) && (txtConfirmaSenha.Text == string.Empty) &&
                    (txtCpf.Text == string.Empty) && (txtUsuario.Text == string.Empty))
                {
                    return;
                }

                if (txtSenha.Text == txtConfirmaSenha.Text)
                {
                    FUNCIONARIO f = conexao.FUNCIONARIO.FirstOrDefault(linha => linha.CPF.Equals(txtCpf.Text));

                    if (f != null)
                    {
                        LOGIN l = new LOGIN();

                        l.FK_FUNCIONARIO = f.ID;
                        l.USUARIO = txtUsuario.Text;
                        l.SENHA = txtSenha.Text;

                        conexao.LOGIN.Add(l);
                        conexao.SaveChanges();
                    }
                }
            }

        }
    }
}