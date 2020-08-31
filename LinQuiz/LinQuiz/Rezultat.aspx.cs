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
    public partial class Rezultat : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);

            Session["doswiadczenie"] = ((int)Session["poprawne_odp"]) * 100;
            poprawneLabel.Text = Session["poprawne_odp"].ToString();
            bledneLabel.Text = Session["bledne_odp"].ToString();
            doswiadczenieLabel.Text = Session["doswiadczenie"].ToString();

            try
            {
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                //Aktualizowanie statystyk użtykownika
                SqlCommand cmd1 = new SqlCommand("UPDATE statystyki SET poprawne_odp=poprawne_odp+'" + Session["poprawne_odp"] + "' WHERE id='" + Session["id"] + "';", con);
                SqlCommand cmd2 = new SqlCommand("UPDATE statystyki SET bledne_odp=bledne_odp+'" + Session["bledne_odp"] + "' WHERE id='" + Session["id"] + "';", con);
                SqlCommand cmd3 = new SqlCommand("UPDATE statystyki SET doswiadczenie=doswiadczenie+'" + Session["doswiadczenie"] + "' WHERE id='" + Session["id"] + "';", con);
                cmd1.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
                cmd3.ExecuteNonQuery();

                //SqlCommand cmd1 = new SqlCommand("UPDATE statystyki SET poprawne_odp=poprawne_odp+1 WHERE id=1", con);
                //cmd1.Parameters.AddWithValue("@poprawneSesja", Session["poprawne_odp"]);
                //cmd1.Parameters.AddWithValue("@idSesja", Session["id"]);

                // Zamknij połączenie
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }



        }
    }
}