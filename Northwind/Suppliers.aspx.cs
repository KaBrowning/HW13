using System;
using System.Web.UI;

/// <summary>
/// Controls the button click events of the page.
/// </summary>
/// <author>Kathryn Browning</author>
/// <version>March 3, 2015</version>
public partial class Suppliers : Page
{
    /// <summary>
    /// Handles the Load event of the Page control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    /// <summary>
    /// Handles the Click event of the btnProducts control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
    protected void btnProducts_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Products.aspx");
    }

    /// <summary>
    /// Handles the Click event of the btnSuppliers control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
    protected void btnSuppliers_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Suppliers.aspx");
    }
}