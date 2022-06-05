using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inter
{
    public partial class listacategoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                {
                    CarregarCategoria(con);
                }
            }
        }

        private void CarregarCategoria(VIACAOARAUJOEntities con)
        {
            List<CATEGORIA> lista = con.CATEGORIA.ToList();
            gridCategoria.DataSource = lista;
            gridCategoria.DataBind();
        }

        protected void gridCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
            {
                int idselecionado = Convert.ToInt32(gridCategoria.SelectedValue);

                CATEGORIA cargo = con.CATEGORIA.FirstOrDefault(
                    linha => linha.ID.ToString().Equals(idselecionado.ToString()));

                txtCategoria.Text = cargo.NOME;
                lblValidacao.Text = string.Empty;
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            try
            {
                using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                {
                    CATEGORIA cat = con.CATEGORIA.FirstOrDefault(
                        linha => linha.ID.ToString().Equals(gridCategoria.SelectedValue.ToString()));

                    cat.NOME=txtCategoria.Text.ToUpper();

                    con.Entry(cat);
                    con.SaveChanges();

                    CarregarCategoria(con);

                    txtCategoria.Text = string.Empty;
                }
            }
            catch (Exception)
            {
                lblValidacao.Text = "Erro ao Editar o registro !";
            }
        }

        protected void btnExcluir_Click(object sender, EventArgs e)
        {
            try
            {
                using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                {
                    CATEGORIA cat = con.CATEGORIA.FirstOrDefault(
                        linha => linha.ID.ToString().Equals(gridCategoria.SelectedValue.ToString()));

                    con.CATEGORIA.Remove(cat);

                    con.SaveChanges();

                    CarregarCategoria(con);

                    txtCategoria.Text = string.Empty;
                }
            }
            catch (Exception)
            {
                lblValidacao.Text = "Não foi possivel excluir o registro";
            }
        }
    }
}