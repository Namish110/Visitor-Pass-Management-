using System;


using System.Web.UI.WebControls;

namespace Visitor_Pass
{
    public partial class PassPreview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string passContent = Session["PassContent"] as string;

            // Set pass content to the Literal control
            litPassContent.Text = passContent;
        }

        protected void ImageMap1_Click(object sender, ImageMapEventArgs e)
        {

        }



        

       

    }
}