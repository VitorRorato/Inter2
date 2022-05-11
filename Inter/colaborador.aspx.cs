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
                using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
                {
                    carregarCargo(conexao);
                    carregarGrid(conexao);
                    carregarFuncionario(conexao);
                }
            }
        }

        private void carregarCargo(VIACAOARAUJOEntities conexao)
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

        private void carregarGrid(VIACAOARAUJOEntities conexao)
        {
            var lista = conexao.FUNCIONARIO.ToList();
            gridColaborador.DataSource = lista;
            gridColaborador.DataBind();

        }

        protected void btnSalvarCargo_Click(object sender, EventArgs e)
        {
            using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
            {
                CARGO cargo = new CARGO();

                cargo = conexao.CARGO.FirstOrDefault(linha => linha.NOME.Equals(txtCargo.Text));

                if (string.IsNullOrWhiteSpace(txtCargo.Text))
                {
                    lblValidacao.Text = "Por Favor Informe o Cargo!";
                    return;
                }
                else
                {
                    if (cargo != null)
                    {
                        lblValidacao.Text = "Cargo ja Cadastrado";
                        return;
                    }

                    CARGO c = new CARGO();
                    c.NOME = txtCargo.Text.ToUpper();
                    conexao.CARGO.Add(c);
                    conexao.SaveChanges();

                    carregarCargo(conexao);
                    
                    txtCargo.Text = string.Empty;
                }
            }
        }

        protected void btnSalvarColaborador_Click(object sender, EventArgs e)
        {
            using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
            {
                if (string.IsNullOrWhiteSpace(txtNomeColabordor.Text) ||
                    string.IsNullOrWhiteSpace(txtCpfColabordor.Text) ||
                    string.IsNullOrWhiteSpace(txtRgColabordor.Text))
                {
                    lblValidacao.Text = "FAVOR PREENCHER TODOS OS DADOS!";
                    return;
                }
                else
                {

                    FUNCIONARIO funcionario = new FUNCIONARIO();

                    funcionario = conexao.FUNCIONARIO.FirstOrDefault(linha => linha.NOME.Equals(txtNomeColabordor.Text));
                    if (funcionario != null)
                    {
                        lblValidacao.Text = "Colaborador Já Cadastrado!";
                        return;
                    }

                    funcionario = conexao.FUNCIONARIO.FirstOrDefault(linha => linha.CPF.Equals(txtCpfColabordor.Text));
                    if (funcionario != null)
                    {
                        lblValidacao.Text = "CPF Já Cadastrado!";
                        return;
                    }
                    
                    funcionario = conexao.FUNCIONARIO.FirstOrDefault(linha => linha.RG.Equals(txtRgColabordor.Text));
                    if (funcionario != null)
                    {
                        lblValidacao.Text = "RG Já Cadastrado!";
                        return;
                    }

                    FUNCIONARIO f = new FUNCIONARIO();

                    f.NOME = txtNomeColabordor.Text.ToUpper();
                    f.CPF = txtCpfColabordor.Text;
                    f.RG = txtRgColabordor.Text;
                    f.FK_CARGO = Convert.ToInt32(cboCargoColabordor.SelectedValue);

                    conexao.FUNCIONARIO.Add(f);

                    conexao.SaveChanges();

                    carregarGrid(conexao);

                    Limpar();

                    carregarFuncionario(conexao);
                }
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
                    FUNCIONARIO f = new FUNCIONARIO();

                    f = conexao.FUNCIONARIO.FirstOrDefault(linha => linha.ID.ToString().Equals(
                        gridColaborador.SelectedValue.ToString()));

                    if (string.IsNullOrWhiteSpace(txtNome.Text) ||
                    string.IsNullOrWhiteSpace(txtCpf.Text) ||
                    string.IsNullOrWhiteSpace(txtRg.Text))
                    {
                        lblValidacao.Text = "FAVOR PREENCHER TODOS OS DADOS!";
                        return;
                    }
                    if (f!=null)
                    {
                        f.NOME = txtNome.Text.ToUpper();
                        f.CPF = txtCpf.Text;
                        f.RG = txtRg.Text;
                        f.FK_CARGO = Convert.ToInt32(ddlCargo.SelectedValue);

                        conexao.Entry(f);

                        gridColaborador.SelectedIndex = -1;

                        conexao.SaveChanges();

                        carregarGrid(conexao);
                    }
                    else
                    {
                        lblValidacao.Text="ERRO";
                    }
                }

            }
        }

        protected void btnEcluir_Click(object sender, EventArgs e)
        {
            try
            {
                using (VIACAOARAUJOEntities conexao = new VIACAOARAUJOEntities())
                {
                    if (gridColaborador.SelectedValue != null)
                    {
                        FUNCIONARIO f = conexao.FUNCIONARIO.FirstOrDefault(
                            linha => linha.ID.ToString().Equals(gridColaborador.SelectedValue.ToString()));

                        conexao.FUNCIONARIO.Remove(f);

                        gridColaborador.SelectedIndex = -1;

                    }

                    Limpar();

                    conexao.SaveChanges();

                    carregarGrid(conexao);
                }
            }
            catch (Exception)
            {
                lblValidacao.Text = "Não é possivel Excluir o registro!";
            }
            
        }

        private void Limpar()
        {
            txtNome.Text = string.Empty;
            txtRg.Text = string.Empty;
            txtCpf.Text = string.Empty;

            txtNomeColabordor.Text = string.Empty;
            txtRgColabordor.Text = string.Empty;
            txtCpfColabordor.Text = string.Empty;
        }

        protected void btnLista_Click(object sender, EventArgs e)
        {
            Response.Redirect("lista.aspx");
        }

        protected void btnSalvarUsuario_Click(object sender, EventArgs e)
        {
            try
            {
                using (VIACAOARAUJOEntities con = new VIACAOARAUJOEntities())
                {
                    LOGIN login = new LOGIN();

                    if (string.IsNullOrWhiteSpace(txtUsuario.Text))
                    {
                        lblValidacao.Text = "Informe o nome de usuario!";
                        return;
                    }
                    else if ((string.IsNullOrWhiteSpace(txtSenha.Text) ||
                        string.IsNullOrWhiteSpace(txtSenha2.Text)) ||
                        (txtSenha2.Text != txtSenha.Text))
                    {
                        lblValidacao.Text = "Senhas inválidas";
                        return;
                    }

                    login.USUARIO = txtUsuario.Text.ToUpper();
                    login.SENHA = txtSenha2.Text;
                    login.FK_FUNCIONARIO = Convert.ToInt32(ddlFuncionario.SelectedValue);

                    con.LOGIN.Add(login);
                    con.SaveChanges();


                }
            }
            catch (Exception)
            {
                lblValidacao.Text = "Erro ao salvar o login!";
            }
            
        }

        private void carregarFuncionario(VIACAOARAUJOEntities con)
        {
            List<FUNCIONARIO> funcionario = con.FUNCIONARIO.ToList();

            ddlFuncionario.DataSource = funcionario;
            ddlFuncionario.DataTextField = "NOME";
            ddlFuncionario.DataValueField = "ID";
            ddlFuncionario.DataBind();
        }
    }
}