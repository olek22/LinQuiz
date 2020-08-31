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
    public partial class StartQuiz : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sendButton_Click(object sender, EventArgs e)
        {
            Session["poprawne_odp"] = 0;
            Session["bledne_odp"] = 0;

            Session["kategoria"] = kategoriaDropDownList.Text;
            Session["poziom"] = poziomDropDownList.Text;

            Random rnd = new Random();
            Session["numer"] = rnd.Next(1, 10000);

            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO quiz(uzytkownik_id, numer) " +
                    "VALUES (" +
                    "'" + Session["id"].ToString() + "'," +
                    "'" + Session["numer"].ToString() + "');", con);
                cmd.ExecuteNonQuery();

                // Q1
                SqlCommand cmd1 = new SqlCommand("SELECT TOP 1 nazwa FROM slowko WHERE kategoria_id=(SELECT id FROM kategoria WHERE nazwa=@kategoriaSesja) AND poziomtrudnosci_id=(SELECT id FROM poziomtrudnosci WHERE nazwa=@poziomSesja) ORDER BY NEWID();", con);
                cmd1.Parameters.AddWithValue("@kategoriaSesja", Session["kategoria"].ToString());
                cmd1.Parameters.AddWithValue("@poziomSesja", Session["poziom"].ToString());

                Session["Q1"] = (String)cmd1.ExecuteScalar();

                // Q2
                SqlCommand cmd2 = new SqlCommand("SELECT TOP 1 nazwa FROM slowko WHERE kategoria_id=(SELECT id FROM kategoria WHERE nazwa=@kategoriaSesja) AND poziomtrudnosci_id=(SELECT id FROM poziomtrudnosci WHERE nazwa=@poziomSesja) ORDER BY NEWID();", con);
                cmd2.Parameters.AddWithValue("@kategoriaSesja", Session["kategoria"].ToString());
                cmd2.Parameters.AddWithValue("@poziomSesja", Session["poziom"].ToString());

                Session["Q2"] = (String)cmd2.ExecuteScalar();

                // Q3
                SqlCommand cmd3 = new SqlCommand("SELECT TOP 1 nazwa FROM slowko WHERE kategoria_id=(SELECT id FROM kategoria WHERE nazwa=@kategoriaSesja) AND poziomtrudnosci_id=(SELECT id FROM poziomtrudnosci WHERE nazwa=@poziomSesja) ORDER BY NEWID();", con);
                cmd3.Parameters.AddWithValue("@kategoriaSesja", Session["kategoria"].ToString());
                cmd3.Parameters.AddWithValue("@poziomSesja", Session["poziom"].ToString());

                Session["Q3"] = (String)cmd3.ExecuteScalar();

                // Q4
                SqlCommand cmd4 = new SqlCommand("SELECT TOP 1 nazwa FROM slowko WHERE kategoria_id=(SELECT id FROM kategoria WHERE nazwa=@kategoriaSesja) AND poziomtrudnosci_id=(SELECT id FROM poziomtrudnosci WHERE nazwa=@poziomSesja) ORDER BY NEWID();", con);
                cmd4.Parameters.AddWithValue("@kategoriaSesja", Session["kategoria"].ToString());
                cmd4.Parameters.AddWithValue("@poziomSesja", Session["poziom"].ToString());

                Session["Q4"] = (String)cmd4.ExecuteScalar();

                // Q5
                SqlCommand cmd5 = new SqlCommand("SELECT TOP 1 nazwa FROM slowko WHERE kategoria_id=(SELECT id FROM kategoria WHERE nazwa=@kategoriaSesja) AND poziomtrudnosci_id=(SELECT id FROM poziomtrudnosci WHERE nazwa=@poziomSesja) ORDER BY NEWID();", con);
                cmd5.Parameters.AddWithValue("@kategoriaSesja", Session["kategoria"].ToString());
                cmd5.Parameters.AddWithValue("@poziomSesja", Session["poziom"].ToString());

                Session["Q5"] = (String)cmd5.ExecuteScalar();

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

            Response.Redirect("Q1.aspx");
        }
    }
}