using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inter
{
    public partial class principal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                    {
                        carregarCombustivel(con);
                        carregarManutencao(con);
                        Combustivel(con);
                        carregarEstoque(con);
                        carregarVeiculo(con);
                    }
                }
            }
            catch (Exception)
            {
                
            }

        }

        private void carregarEstoque(VIACAOARAUJOEntities con)
        {
            List<PRODUTO> lista = con.PRODUTO.Where(x => x.QUANTIDADE.Equals(0)).ToList();
            gridEstoque.DataSource = lista.OrderBy(x => x.CODIGO);
            gridEstoque.DataBind();

        }        

        private void carregarCombustivel(VIACAOARAUJOEntities con)
        {
            List<COMBUSTIVEL_DISPONIVEL> lista = con.COMBUSTIVEL_DISPONIVEL.ToList();
            gridCombustivel.DataSource = lista;
            gridCombustivel.DataBind();
        }

        private void carregarManutencao(VIACAOARAUJOEntities con)
        {
            List<MANUTENCAO> lista = con.MANUTENCAO.OrderBy(x=>x.DATA).ToList();

            int id = lista.Last().ID;

            List<MANUTENCAO> resultado = con.MANUTENCAO.Where(
                linha => linha.ID.ToString().Equals(id.ToString())).ToList(); ;

            gridManutencao.DataSource = resultado;
            gridManutencao.DataBind();
        }

        private void carregarVeiculo(VIACAOARAUJOEntities con)
        {
            List<VEICULO> lista = con.VEICULO.ToList();

            ddlVeiculo.DataSource = lista;
            ddlVeiculo.DataValueField = "ID";
            ddlVeiculo.DataTextField = "PREFIXO";
            ddlVeiculo.DataBind();
        }

        private void Combustivel(VIACAOARAUJOEntities con)
        {
            List<ABASTECIMENTO> lista = con.ABASTECIMENTO.OrderBy(x => x.DATA_ABASTECIMENTO).ToList();

            int id = lista.Last().ID;

            List<ABASTECIMENTO> res = con.ABASTECIMENTO.Where(
                linha=>linha.ID.ToString().Equals(id.ToString())).ToList();

            gridAbastecimento.DataSource = res;
            gridAbastecimento.DataBind();
        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            try
            {
                using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                {
                    double kmCombustivel = 0, kmOleo = 0, kmAtual = 0, km = 0;

                    if (double.TryParse(txtCheck.Text, out kmAtual) == false)
                    {
                        lblCheckCombustivel.Text = "Quilometragem invalida!";
                        return;
                    }

                    List<MANUTENCAO> comb = con.MANUTENCAO.Where(x => x.FK_VEICULO.ToString().Equals(ddlVeiculo.SelectedValue.ToString()) && 
                        x.FILTRO_COMBUSTIVEL != null).OrderBy(x=>x.DATA).ToList();


                    List<MANUTENCAO> oleo = con.MANUTENCAO.Where(x => x.FK_VEICULO.ToString().Equals(ddlVeiculo.SelectedValue.ToString()) &&
                        x.FILTRO_OLEO_MOTOR != null).OrderBy(x=>x.DATA).ToList();

                    if (comb.Count() > 0)
                    {
                        kmCombustivel = comb.Last().KM_PROXIMA_TROCA - kmAtual;

                        if (kmCombustivel >= 0)
                        {
                            lblCheckCombustivel.Text = "Troca de filtros Combustivel: Restam: " + kmCombustivel.ToString() + " KM para proxima Troca";
                        }
                        else
                        {
                            kmCombustivel = kmCombustivel * (-1);
                            lblCheckCombustivel.Text = "Troca de filtro Combustivel: Manutenção Vencida com " + kmCombustivel.ToString() + " KM";
                        }
                    }
                    

                    if (oleo.Count > 0)
                    {
                        kmOleo = oleo.Last().KM_PROXIMA_TROCA - kmAtual;


                        if (kmOleo >= 0)
                        {
                            lblCheckOleo.Text = "Troca de Oleo e filtro Motor: Restam " + kmOleo.ToString() + " KM para proxima Troca";
                        }
                        else
                        {
                            kmOleo = kmOleo * (-1);
                            lblCheckOleo.Text = "Troca de Oleo e filtro Motor: Manutenção Vencida com " + kmOleo.ToString() + " KM";
                        }
                    }
                    
                }
            }
            catch (Exception)
            {
                throw;
              
            }
        }
    }
}