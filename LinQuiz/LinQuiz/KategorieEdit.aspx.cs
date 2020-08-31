using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LinQuiz
{
    public partial class KategorieEdit : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!(Session["czy_admin"].Equals("1")))
                {
                    Response.Redirect("Login.aspx");
                }
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void dodajButton_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO kategoria(nazwa) " +
                    "VALUES (" +
                    "'" + nazwaTextBox.Text.Trim() + "');", con);
                cmd.ExecuteNonQuery();

                Response.Write("<script>alert('Dodałeś nową kategorie')</script>");

                con.Close();
                GridView1.DataBind();

                nazwaTextBox.Text = "";
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}