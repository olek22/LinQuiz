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
    public partial class UserProfile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                String nazwaUser;
                int doswUser;
                int poprUser;
                int bledneUser;

                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                // Nazwa
                SqlCommand cmd1 = new SqlCommand("SELECT nazwa FROM uzytkownik WHERE nazwa=@nazwaSesja", con);
                cmd1.Parameters.AddWithValue("@nazwaSesja", Session["nazwa"].ToString());

                nazwaUser = (String)cmd1.ExecuteScalar();
                nazwaLabel.Text = nazwaUser;

                // Doświadczenie
                SqlCommand cmd2 = new SqlCommand("SELECT ilosc_doswiadczenia FROM statystyki WHERE id=@idSesja", con);
                cmd2.Parameters.AddWithValue("@idSesja", Session["id"].ToString());

                doswUser = (int)cmd2.ExecuteScalar();
                doswLabel.Text = Convert.ToString(doswUser);

                // Poprawne odp.
                SqlCommand cmd3 = new SqlCommand("SELECT poprawne_odp FROM statystyki WHERE id=@idSesja", con);
                cmd3.Parameters.AddWithValue("@idSesja", Session["id"].ToString());

                poprUser = (int)cmd3.ExecuteScalar();
                poprLabel.Text = Convert.ToString(poprUser);

                // Błędne odp.
                SqlCommand cmd4 = new SqlCommand("SELECT bledne_odp FROM statystyki WHERE id=@idSesja", con);
                cmd4.Parameters.AddWithValue("@idSesja", Session["id"].ToString());

                bledneUser = (int)cmd4.ExecuteScalar();
                bledneLabel.Text = Convert.ToString(bledneUser);

                // Zamknij połączenie
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

            try
            {
                if (!(Session["czy_admin"].Equals("0")))
                {
                    Response.Redirect("Login.aspx");
                }
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void zmienButton_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE uzytkownik SET haslo='" + hasloTextBox.Text.Trim() + "' WHERE nazwa='" + Session["nazwa"] + "';", con);
                cmd.ExecuteNonQuery();

                Response.Write("<script>alert('Zmieniłeś swoje hasło')</script>");

                con.Close();

                hasloTextBox.Text = "";
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}