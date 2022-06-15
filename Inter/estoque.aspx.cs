using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inter
{
    public partial class estoque : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                {
                    CarregarCategoria(con);
                    CarregarEstoque(con);
                    CarregarEntrada(con);
                    CarregarSaida(con);
                    CarregarFornecedor(con);
                    CarregarFuncionario(con);
                    CarregarProduto(con);
                    CarregarVeiculo(con);
                }

            }
        }

        private void Limpar()
        {
            txtAplicacao.Text = String.Empty;
            txtCategoria.Text = String.Empty;
            txtCodigo.Text = String.Empty;
            txtDataEtrada.Text = String.Empty;
            txtDataSaida.Text = String.Empty;
            txtEditarAplicao.Text = String.Empty;
            txtEditarCodigo.Text = String.Empty;
            txtEditarQuantidade.Text = String.Empty;
            txtQuantidade.Text = String.Empty;
            txtQuantidadeEntrada.Text = String.Empty;
            txtQuantidadeSaida.Text = String.Empty;
            
        }

        private void CarregarVeiculo(VIACAOARAUJOEntities con)
        {
            List<VEICULO> lista = con.VEICULO.ToList();

            ddlVeiculoSaida.DataSource = lista.OrderBy(x => x.PREFIXO);
            ddlVeiculoSaida.DataTextField = "PREFIXO";
            ddlVeiculoSaida.DataValueField = "ID";
            ddlVeiculoSaida.DataBind();
        }

        private void CarregarProduto(VIACAOARAUJOEntities con)
        {
            List<PRODUTO> lista = con.PRODUTO.ToList();

            ddlProdutoEntrada.DataSource = lista;
            ddlProdutoEntrada.DataTextField = "CODIGO";
            ddlProdutoEntrada.DataValueField = "ID";
            ddlProdutoEntrada.DataBind();

            ddlProdutoSaida.DataSource = lista;
            ddlProdutoSaida.DataTextField = "CODIGO";
            ddlProdutoSaida.DataValueField = "ID";
            ddlProdutoSaida.DataBind();
        }

        private void CarregarFuncionario(VIACAOARAUJOEntities con)
        {
            List<FUNCIONARIO> list = con.FUNCIONARIO.ToList();

            ddlFuncionarioEntrada.DataSource = list.OrderBy(x => x.NOME);
            ddlFuncionarioEntrada.DataTextField = "NOME";
            ddlFuncionarioEntrada.DataValueField = "ID";
            ddlFuncionarioEntrada.DataBind();

            ddlFuncionarioSaida.DataSource = list.OrderBy(x => x.NOME);
            ddlFuncionarioSaida.DataTextField = "NOME";
            ddlFuncionarioSaida.DataValueField = "ID";
            ddlFuncionarioSaida.DataBind();
        }

        private void CarregarFornecedor(VIACAOARAUJOEntities con)
        {
            List<FORNECEDOR> lista = con.FORNECEDOR.ToList();
            ddlFornecedorEntrada.DataSource = lista.OrderBy(x => x.NOME);
            ddlFornecedorEntrada.DataTextField = "NOME";
            ddlFornecedorEntrada.DataValueField = "ID";
            ddlFornecedorEntrada.DataBind();
        }

        private void CarregarSaida(VIACAOARAUJOEntities con)
        {
            List<PRODUTO_SAIDA> saida = con.PRODUTO_SAIDA.ToList();

            gridSaida.DataSource = saida.OrderBy(x => x.DATA).Reverse();
            gridSaida.DataBind();
        }

        private void CarregarEntrada(VIACAOARAUJOEntities con)
        {
            List<PRODUTO_ENTRADA> entrada = con.PRODUTO_ENTRADA.ToList();
            gridEntrada.DataSource = entrada.OrderBy(x => x.DATA).Reverse();
            gridEntrada.DataBind();
        }

        private void CarregarEstoque(VIACAOARAUJOEntities con)
        {
            List<PRODUTO> prod = con.PRODUTO.Where(x=>x.QUANTIDADE>0).ToList();

            gridEstoque.DataSource = prod.OrderBy(x => x.QUANTIDADE);
            gridEstoque.DataBind();
        }

        private void CarregarCategoria(VIACAOARAUJOEntities con)
        {
            List<CATEGORIA> lista = con.CATEGORIA.ToList();

            ddlCategoria.DataSource = lista;
            ddlCategoria.DataTextField = "NOME";
            ddlCategoria.DataValueField = "ID";
            ddlCategoria.DataBind();

            ddlEditarCategoria.DataSource = lista;
            ddlEditarCategoria.DataTextField = "NOME";
            ddlEditarCategoria.DataValueField = "ID";
            ddlEditarCategoria.DataBind();

            ddlBuscaCategoria.DataSource = lista;
            ddlBuscaCategoria.DataTextField = "NOME";
            ddlBuscaCategoria.DataValueField = "ID";
            ddlBuscaCategoria.DataBind();
        }

        protected void btnLista_Click(object sender, EventArgs e)
        {
            Response.Redirect("listacategoria.aspx");
        }

        protected void btnSalvarCategoria_Click(object sender, EventArgs e)
        {
            try
            {
                using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                {
                    CATEGORIA cat = new CATEGORIA();

                    if (string.IsNullOrWhiteSpace(txtCategoria.Text))
                    {
                        lblValidacao.Text = "Informe o nome da categoria.";
                        return;
                    }

                    cat.NOME = txtCategoria.Text.ToUpper();

                    con.CATEGORIA.Add(cat);
                    con.SaveChanges();

                    CarregarCategoria(con);

                    txtCategoria.Text = string.Empty;

                    Limpar();
                }
            }
            catch (Exception)
            {
                lblValidacao.Text = "Erro ao salvar categoria";
            }
        }

        protected void btnSalvarItem_Click(object sender, EventArgs e)
        {
            int qtd = 0;

            if (string.IsNullOrWhiteSpace(txtCodigo.Text) &&
                string.IsNullOrWhiteSpace(txtAplicacao.Text) &&
                string.IsNullOrWhiteSpace(txtQuantidade.Text))
            {
                lblValidacao.Text = "Por Favor prenche todos os campos !";
                return;
            }

            if (int.TryParse(txtQuantidade.Text, out qtd) == false)
            {
                lblValidacao.Text = "Quantidade Invalida !";
                return;
            }

            if (ddlCategoria==null)
            {
                lblValidacao.Text = "Insira a categoria Do Item";
                return;
            }

            try
            {
                using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                {
                    PRODUTO prod = new PRODUTO();

                    prod.CODIGO = txtCodigo.Text.ToUpper();
                    prod.QUANTIDADE = qtd;
                    prod.APLICACAO = txtAplicacao.Text.ToUpper();
                    prod.FK_CATEGORIA = Convert.ToInt32(ddlCategoria.SelectedValue);

                    con.PRODUTO.Add(prod);
                    con.SaveChanges();

                    CarregarEstoque(con);

                    Limpar();
                }
            }
            catch (Exception)
            {

            }
        }

        protected void btnSalvarEntrada_Click(object sender, EventArgs e)
        {
            try
            {
                int qtd = 0, total;



                if (string.IsNullOrWhiteSpace(txtQuantidadeEntrada.Text) ||
                    int.TryParse(txtQuantidadeEntrada.Text, out qtd) == false)
                {
                    lblValidacao.Text = "Quantidade Inválida!";
                    return;
                }
                if (string.IsNullOrEmpty(txtDataEtrada.Text))
                {
                    lblValidacao.Text = "Informe uma data valida";
                    return;
                }

                if (ddlProdutoEntrada == null)
                {
                    lblValidacao.Text = "Selecione o Codigo do item";
                    return;
                }
                if (ddlFornecedorEntrada == null)
                {
                    lblValidacao.Text = "Selecione o Fornecedor";
                    return;
                }

                using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                {
                    PRODUTO_ENTRADA entrada = new PRODUTO_ENTRADA();

                    PRODUTO prod = con.PRODUTO.FirstOrDefault(x => x.ID.ToString().Equals(ddlProdutoEntrada.SelectedValue.ToString()));

                    total = prod.QUANTIDADE;

                    total = total + qtd;

                    prod.QUANTIDADE = total;

                    entrada.DATA = Convert.ToDateTime(txtDataEtrada.Text);
                    entrada.QUANTIDADE = qtd;
                    entrada.FK_PRODUTO = Convert.ToInt32(ddlProdutoEntrada.SelectedValue);
                    entrada.FK_FUNCIONARIO = Convert.ToInt32(ddlFuncionarioEntrada.SelectedValue);
                    entrada.FK_FORNECEDOR = Convert.ToInt32(ddlFornecedorEntrada.SelectedValue);

                    con.Entry(prod);

                    con.PRODUTO_ENTRADA.Add(entrada);
                    con.SaveChanges();


                    CarregarEntrada(con);
                    CarregarEstoque(con);
                    CarregarProduto(con);

                    Limpar();
                }
            }
            catch (Exception)
            {

            }
        }

        protected void btnEditarItem_Click(object sender, EventArgs e)
        {
            int qtd = 0;

            if (string.IsNullOrWhiteSpace(txtEditarCodigo.Text) &&
                string.IsNullOrWhiteSpace(txtEditarAplicao.Text) &&
                string.IsNullOrWhiteSpace(txtEditarQuantidade.Text))
            {
                lblValidacao.Text = "Por Favor prenche todos os campos !";
                return;
            }

            if (int.TryParse(txtEditarQuantidade.Text, out qtd) == false)
            {
                lblValidacao.Text = "Quantidade Invalida !";
                return;
            }

            try
            {
                using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                {
                    PRODUTO prod = con.PRODUTO.FirstOrDefault(x => x.ID.ToString().Equals(gridEstoque.SelectedValue.ToString()));

                    prod.CODIGO = txtEditarCodigo.Text.ToUpper();
                    prod.QUANTIDADE = qtd;
                    prod.APLICACAO = txtEditarAplicao.Text.ToUpper();
                    prod.FK_CATEGORIA = Convert.ToInt32(ddlEditarCategoria.SelectedValue);

                    con.Entry(prod);
                    con.SaveChanges();

                    CarregarEstoque(con);
                    CarregarEntrada(con);
                    CarregarSaida(con);
                    Limpar();
                }
            }
            catch (Exception)
            {

            }
        }

        protected void btnSalvarSaida_Click(object sender, EventArgs e)
        {
            try
            {
                int qtd = 0, total;



                if (string.IsNullOrWhiteSpace(txtQuantidadeSaida.Text) ||
                    int.TryParse(txtQuantidadeSaida.Text, out qtd) == false)
                {
                    lblValidacao.Text = "Quantidade Inválida!";
                    return;
                }
                if (string.IsNullOrEmpty(txtDataSaida.Text))
                {
                    lblValidacao.Text = "Informe uma data valida";
                    return;
                }
                if (ddlProdutoEntrada == null)
                {
                    lblValidacao.Text = "Selecione o Codigo do item";
                    return;
                }
                if (ddlProdutoSaida == null)
                {
                    lblValidacao.Text = "Nenhum Item selecionado";
                    return;
                }


                using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                {
                    PRODUTO_SAIDA saida = new PRODUTO_SAIDA();

                    PRODUTO prod = con.PRODUTO.FirstOrDefault(x => x.ID.ToString().Equals(ddlProdutoSaida.SelectedValue.ToString()));

                    total = prod.QUANTIDADE;


                    if (total<=0)
                    {
                        lblValidacao.Text = "Não possui esse item no estoque";
                        return;
                    }

                    total = total - qtd;

                    if (total<0)
                    {
                        lblValidacao.Text = "Não possui esse item no estoque";
                        return;
                    }

                    prod.QUANTIDADE = total;

                    saida.DATA = Convert.ToDateTime(txtDataSaida.Text);
                    saida.QUANTIDADE = qtd;
                    saida.FK_PRODUTO = Convert.ToInt32(ddlProdutoSaida.SelectedValue);
                    saida.FK_FUNCIONARIO = Convert.ToInt32(ddlFuncionarioSaida.SelectedValue);
                    saida.FK_VEICULO = Convert.ToInt32(ddlVeiculoSaida.SelectedValue);

                    con.Entry(prod);

                    con.PRODUTO_SAIDA.Add(saida);
                    con.SaveChanges();


                    CarregarSaida(con);
                    CarregarEstoque(con);

                    Limpar();

                    CarregarSaida(con);
                }
            }
            catch (Exception)
            {

            }
        }

        protected void btnExcluir_Click(object sender, EventArgs e)
        {
            try
            {
                using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                {
                    if (gridEstoque.SelectedValue != null)
                    {
                        PRODUTO p = con.PRODUTO.FirstOrDefault(x => x.ID.ToString().Equals(gridEstoque.SelectedValue.ToString()));

                        con.PRODUTO.Remove(p);
                        con.SaveChanges();

                        gridEstoque.SelectedIndex = -1;

                        CarregarEstoque(con);

                        lblValidacao.Text = string.Empty;

                        gridEstoque.SelectedIndex=-1;
                    }
                    else
                    {
                        lblValidacao.Text = "Selecione um Registro";
                    }
                }
            }
            catch (Exception)
            {

            }
        }

        protected void gridEstoque_SelectedIndexChanged(object sender, EventArgs e)
        {
            Limpar();

            try
            {
                using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                {
                    int idselecionado = Convert.ToInt32(gridEstoque.SelectedValue);

                    PRODUTO p = con.PRODUTO.FirstOrDefault(
                        linha => linha.ID.ToString().Equals(idselecionado.ToString()));

                    txtEditarCodigo.Text = p.CODIGO.ToString().ToUpper();
                    ddlEditarCategoria.SelectedValue = p.FK_CATEGORIA.ToString();
                    txtEditarAplicao.Text = p.APLICACAO.ToString().ToUpper();
                    txtEditarQuantidade.Text = p.QUANTIDADE.ToString();


                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnBusca_Click(object sender, EventArgs e)
        {
            using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
            {
                if (chkTodos.Checked)
                {
                    List<PRODUTO> lista = conexao.PRODUTO.Where(linha => linha.CODIGO.Contains(txtBusca.Text)).ToList();

                    gridEstoque.DataSource = lista.OrderBy(x => x.QUANTIDADE);
                    gridEstoque.DataBind();
                }
                else
                {
                    List<PRODUTO> lista = conexao.PRODUTO.Where(x => x.FK_CATEGORIA.ToString().Equals(ddlBuscaCategoria.SelectedValue.ToString())
                    && x.CODIGO.Contains(txtBusca.Text)).ToList();


                    gridEstoque.DataSource = lista.OrderBy(x=>x.QUANTIDADE);
                    gridEstoque.DataBind();
                }
            }
        }

    }
}