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
    public partial class Rejestracja : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (weryfikacjaUzytkownika())
            {
                Response.Write("<script>alert('Istnieje użytkownik o podanej nazwie, spróbuj innej');</script>");
            }
            else
            {
                rejestracjaUzytkownika();
            }
        }

        // weryfikacja użytkownika
        bool weryfikacjaUzytkownika()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM uzytkownik WHERE nazwa=@nazwa", con);

                cmd.Parameters.AddWithValue("@nazwa", TextBox1.Text.Trim());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);


                if(dt.Rows.Count >= 1)
                {
                    return true; 
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }


        void rejestracjaUzytkownika()
        {
            //Response.Write("<script>alert('Testowanie');</script>");
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO uzytkownik (nazwa, haslo, czy_admin) values (@nazwa, @haslo, 0)", con);

                cmd.Parameters.AddWithValue("@nazwa", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@haslo", TextBox8.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Pomyślnie dodano użytkownika. Zaloguj się aby skorzytać z funkcjonalności LinQuiz!');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

    }
}