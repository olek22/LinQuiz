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
    public partial class Q4 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        String wylosowaneSlowko, wybraneSlowko, poprawneSlowko;
        int wylosowanaDefinicja, wybranaDefinicja;

        protected void bladButton_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO zgloszenie(uzytkownik, slowko) " +
                    "VALUES (" +
                    "'" + Session["nazwa"].ToString() + "'," +
                    "'" + Session["Q4"].ToString() + "');", con);
                cmd.ExecuteNonQuery();

                //Response.Write("<script>alert('Wysłałeś zgłoszenie błędu')</script>");

                con.Close();
            }
            catch (Exception ex)
            {
                //Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

            bladButton.Visible = false;
            bladLabel.Visible = true;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);

            PoziomTrudnosci.Text = (string)Session["poziom"];
            Kategoria.Text = (string)Session["kategoria"];

            try
            {
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                // Nazwa
                SqlCommand cmd1 = new SqlCommand("SELECT TOP 1 nazwa FROM slowko WHERE kategoria_id=(SELECT id FROM kategoria WHERE nazwa=@kategoriaSesja) AND poziomtrudnosci_id=(SELECT id FROM poziomtrudnosci WHERE nazwa=@poziomSesja) ORDER BY NEWID();", con);
                cmd1.Parameters.AddWithValue("@kategoriaSesja", Session["kategoria"].ToString());
                cmd1.Parameters.AddWithValue("@poziomSesja", Session["poziom"].ToString());

                wylosowaneSlowko = (String)cmd1.ExecuteScalar();
                wylosowaneLabel.Text = Session["Q4"].ToString();

                SqlCommand cmd1b = new SqlCommand("SELECT definicja_id FROM slowko WHERE nazwa=@slowko;", con);
                cmd1b.Parameters.AddWithValue("@slowko", Session["Q4"].ToString());

                wylosowanaDefinicja = (int)cmd1b.ExecuteScalar();

                // Zamknij połączenie
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void sendButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);

            con.Open();

            wybraneSlowko = odpTextBox.Text;
            wybraneLabel.Text = wybraneSlowko;

            SqlCommand cmd2 = new SqlCommand("SELECT id FROM definicja WHERE tlumaczenie='" + odpTextBox.Text.Trim() + "';", con);

            SqlCommand cmd3 = new SqlCommand("SELECT tlumaczenie FROM definicja WHERE id='" + wylosowanaDefinicja + "';", con);
            poprawneSlowko = (String)cmd3.ExecuteScalar();

            sendButton.Visible = false;
            odpTextBox.Visible = false;
            nastepneButton.Visible = true;

            SqlDataReader dr = cmd2.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    wybranaDefinicja = (int)dr.GetValue(0);

                    if (wylosowanaDefinicja == wybranaDefinicja)
                    {
                        checkLabel.Text = "Brawo! Poprawna odpowiedź";
                        Session["poprawne_odp"] = ((int)Session["poprawne_odp"]) + 1;
                    }
                }
            }
            else
            {
                checkLabel.Text = "Źle! Poprawna odpowiedź to: ";
                PoprawnaLabel.Text = poprawneSlowko;
                Session["bledne_odp"] = ((int)Session["bledne_odp"]) + 1;
            }

            // Zamknij połączenie
            con.Close();
        }

        protected void nastepnaButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Q5.aspx");
        }
    }
}