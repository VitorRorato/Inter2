using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inter
{
    public partial class lista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                {
                    carregarCargos(con);
                }
            }
        }

        private void carregarCargos(VIACAOARAUJOEntities con)
        {
            List<CARGO> lista = con.CARGO.ToList();
            gridCargo.DataSource = lista;
            gridCargo.DataBind();
        }

        protected void gridCargo_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
            {
                int idselecionado = Convert.ToInt32(gridCargo.SelectedValue);

                CARGO cargo = con.CARGO.FirstOrDefault(
                    linha => linha.ID.ToString().Equals(idselecionado.ToString()));

                txtCargo.Text = cargo.NOME;
                lblValidacao.Text = string.Empty;
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtCargo.Text))
            {
                lblValidacao.Text = "Dado inválido!";
                return;
            }
            else
            {
                if (gridCargo.SelectedValue != null)
                {
                    using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                    {

                        CARGO cargo = con.CARGO.FirstOrDefault(
                            linha => linha.ID.ToString().Equals(gridCargo.SelectedValue.ToString()));

                        cargo.NOME = txtCargo.Text.ToUpper();

                        con.Entry(cargo);

                        con.SaveChanges();

                        carregarCargos(con);

                        txtCargo.Text = string.Empty;

                        gridCargo.SelectedIndex = -1;
                    }
                }
            }
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("principal.aspx");
        }
    }
}