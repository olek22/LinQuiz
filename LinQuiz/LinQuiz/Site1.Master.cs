using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LinQuiz
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            zaloguj.Visible = true;

            admin.Visible = false;
            rozpocznij.Visible = false;
            wyloguj.Visible = false;
            profil.Visible = false;
            ranking.Visible = false;

            try
            {
                // co widzi użytkownk jeśli jest nie zalogowany

                // jeśli użytkownik jest zalogowany ale nie jest adminem
                if (Session["czy_admin"].Equals("0"))
                {
                    zaloguj.Visible = false;

                    profil.Visible = true;
                    admin.Visible = false;

                    rozpocznij.Visible = true;
                    ranking.Visible = true;

                    wyloguj.Visible = true;
                }

                // co widzi admin
                else if (Session["czy_admin"].Equals("1"))
                {
                    zaloguj.Visible = false;

                    profil.Visible = false;
                    admin.Visible = true;

                    rozpocznij.Visible = false;
                    ranking.Visible = false;

                    wyloguj.Visible = true;
                }
            }
            catch
            {

            }

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["id"] = "";
            Session["nazwa"] = "";
            Session["czy_admin"] = "";
            Response.Redirect("Default.aspx");
        }
    }
}