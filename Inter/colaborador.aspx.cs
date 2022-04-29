using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inter
{
    public partial class colaborador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                carregarCargo();
                carregarGrid();
            }
        }

        private void carregarCargo()
        {
            using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
            {
                List<CARGO> lista = new List<CARGO>();

                lista = conexao.CARGO.ToList();
                cboCargoColabordor.DataSource = lista;
                cboCargoColabordor.DataValueField = "ID";
                cboCargoColabordor.DataTextField = "NOME";
                cboCargoColabordor.DataBind();

                lista = conexao.CARGO.ToList();
                ddlCargo.DataSource = lista;
                ddlCargo.DataValueField = "ID";
                ddlCargo.DataTextField = "NOME";
                ddlCargo.DataBind();
            }
        }

        private void carregarGrid()
        {
            using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
            {
                var lista = conexao.FUNCIONARIO.ToList();
                gridColaborador.DataSource = lista;
                gridColaborador.DataBind();
            }
        }

        protected void btnSalvarCargo_Click(object sender, EventArgs e)
        {
            using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
            {
                CARGO cargo = new CARGO();

                cargo.NOME = txtCargo.Text.ToUpper();

                conexao.CARGO.Add(cargo);
                conexao.SaveChanges();
                Response.Redirect("colaborador.aspx");
            }

        }

        protected void btnSalvarColaborador_Click(object sender, EventArgs e)
        {
            using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
            {
                FUNCIONARIO funcionario = new FUNCIONARIO();

                funcionario.NOME = txtNomeColabordor.Text.ToUpper();
                funcionario.CPF = txtCpfColabordor.Text;
                funcionario.RG = txtRgColabordor.Text;
                funcionario.FK_CARGO = Convert.ToInt32(cboCargoColabordor.SelectedValue);

                conexao.FUNCIONARIO.Add(funcionario);
                conexao.SaveChanges();

                Response.Redirect("colaborador.aspx");
            }
        }

        protected void btnBusca_Click(object sender, EventArgs e)
        {
            using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
            {
                List<FUNCIONARIO> lista = conexao.FUNCIONARIO.Where(linha => linha.NOME.Contains(txtBusca.Text)).ToList();

                gridColaborador.DataSource = lista;
                gridColaborador.DataBind();
            }
        }

        protected void gridColaborador_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
            {
                int idselecionado = Convert.ToInt32(gridColaborador.SelectedValue);

                FUNCIONARIO funcionario = conexao.FUNCIONARIO.FirstOrDefault(
                    linha => linha.ID.ToString().Equals(idselecionado.ToString()));

                txtNome.Text = funcionario.NOME;
                txtRg.Text = funcionario.RG;
                txtCpf.Text = funcionario.CPF;
                ddlCargo.SelectedValue = funcionario.FK_CARGO.ToString();
            }
        }


        protected void btnEditar_Click (object sender, EventArgs e)
        {
            using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
            {
                if (gridColaborador.SelectedValue != null)
                {
                    FUNCIONARIO f = conexao.FUNCIONARIO.FirstOrDefault(linha => linha.ID.ToString().Equals(
                        gridColaborador.SelectedValue.ToString()));

                    f.NOME = txtNome.Text.ToUpper();
                    f.CPF = txtCpf.Text;
                    f.RG = txtRg.Text;
                    f.FK_CARGO = Convert.ToInt32(ddlCargo.SelectedValue);

                    conexao.Entry(f);

                    gridColaborador.SelectedIndex = -1;

                }

                conexao.SaveChanges();

                carregarGrid();
            }
        }

        protected void btnEcluir_Click(object sender, EventArgs e)
        {
            using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
            {
                if (gridColaborador.SelectedValue != null)
                {
                    FUNCIONARIO f = conexao.FUNCIONARIO.FirstOrDefault(linha => linha.ID.ToString().Equals(
                        gridColaborador.SelectedValue.ToString()));

                    conexao.FUNCIONARIO.Remove(f);

                    gridColaborador.SelectedIndex = -1;

                }

                conexao.SaveChanges();

                carregarGrid();
            }
        }
    }
}