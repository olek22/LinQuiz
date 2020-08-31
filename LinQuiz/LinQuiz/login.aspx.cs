using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LinQuiz
{
    public partial class login : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // logowanie
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from uzytkownik where nazwa='" + TextBox1.Text.Trim() +
                                                "' AND haslo='" + TextBox2.Text.Trim() + "'", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["id"]= dr.GetValue(0);
                        Session["nazwa"]= dr.GetValue(2).ToString();
                        Session["czy_admin"] = dr.GetValue(4).ToString();
                    }
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Błąd logowania');</script>");
                }

            }
            catch (Exception ex)
            {

            }


        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Rejestracja.aspx");
        }
    }
}