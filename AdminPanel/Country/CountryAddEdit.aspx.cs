using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Country_CountryAddEdit : System.Web.UI.Page
{
    #region Load Event
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //if (Request.QueryString["CountryID"] != null)
            if (Page.RouteData.Values["CountryID"] != null)
            {
                lblMessage.Text = "Edit Mode | CountryID = " + Page.RouteData.Values["CountryID"].ToString().Trim();
                FillCountryControls(Convert.ToInt32(Page.RouteData.Values["CountryID"]));
            }
            else
            {
                lblMessage.Text = "Add Mode" + Page.RouteData.Values["Operation"];
            }

        }
    }
    #endregion Load Event

    #region Button : Save
    protected void btnSave_Click(object sender, EventArgs e)
    {
        
        #region Local Variable
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
        SqlString strCountryName = SqlString.Null;
        SqlString strCountryCode = SqlString.Null;        
        SqlString strCreationDate = SqlString.Null;
        #endregion Local Variable

        try
        {
            #region Server Side Validation
            String strErrorMessage = "";
            if (txtCountryName.Text.Trim() == "")
                strErrorMessage += "- Enter Country Name <br/>";
            if (txtCountryCode.Text.Trim() == "")
                strErrorMessage += "- Enter Country Code <br/><hr/>";
            if (strErrorMessage != "")
            {
                lblMessage.Text = strErrorMessage;
                return;
            }
            #endregion Server Side Validation

            #region set connection & command object
            if (objConn.State != ConnectionState.Open)
                objConn.Open();
            //SqlCommand objCmd = new SqlCommand();
            //objCmd.Connection = objConn;
            SqlCommand objCmd = objConn.CreateCommand();
            objCmd.CommandType = CommandType.StoredProcedure;
            strCountryName = txtCountryName.Text.Trim();
            strCountryCode = txtCountryCode.Text.Trim();
           
            objCmd.Parameters.AddWithValue("@CountryName", strCountryName);
            objCmd.Parameters.AddWithValue("@CountryCode", strCountryCode);
            #endregion set connection & command object

            if (Request.QueryString["CountryID"] != null) 
            {
                #region Update Record
                //edit mode
                objCmd.Parameters.AddWithValue("@CountryID", Page.RouteData.Values["CountryID"].ToString().Trim());
                objCmd.CommandText = "[dbo].[PR_Country_UpdateByPK]";
                objCmd.ExecuteNonQuery();
                Response.Redirect("/AdminPanel/Country/List", true);
                #endregion Update Record
            }
            else
            {
                #region Insert Record
                //Add Mode
                objCmd.Parameters.AddWithValue("@CreationDate", DateTime.Now);
                objCmd.CommandText = "[dbo].[PR_Country_Insert]";
                objCmd.ExecuteNonQuery();
             
                objConn.Close();

                lblMessage.Text = "Data Inserted Successfully";
                txtCountryName.Text = "";
                txtCountryCode.Text = "";
                txtCountryName.Focus();
                #endregion Insert Record

            }

            if (objConn.State == ConnectionState.Open)
                objConn.Close();
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
        finally
        {
            if (objConn.State == ConnectionState.Open)
                objConn.Close();
        }
    }
    #endregion Button : Save

    #region Button : Cancel
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("/AdminPanel/Country/List", true);
    }
    #endregion Button : Cancel

    #region FillCountryControls
    private void FillCountryControls(SqlInt32 CountryID)
    {
        SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString.Trim());

        try
        {
            if (objConn.State != ConnectionState.Open)
                objConn.Open();
            SqlCommand objCmd = objConn.CreateCommand();
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandText = "PR_Country_SelectByPK";
            objCmd.Parameters.AddWithValue("@CountryID", Page.RouteData.Values["CountryID"].ToString().Trim());
            //objCmd.Parameters.AddWithValue("@CountryName", txtCountryName.ToString().Trim());
            //objCmd.Parameters.AddWithValue("@CountryCode", txtCountryCode.ToString().Trim());


            SqlDataReader objSDR = objCmd.ExecuteReader();
            if (objSDR.HasRows)
            {
                while (objSDR.Read())
                {
                    //Response.Write(objSDR["CountryName"].ToString().Trim());
                    if (objSDR["CountryName"].Equals(DBNull.Value) != true)
                    {
                        txtCountryName.Text = objSDR["CountryName"].ToString().Trim();
                    }
                    if (objSDR["CountryCode"].Equals(DBNull.Value) != true)
                    {
                        txtCountryCode.Text = objSDR["CountryCode"].ToString().Trim();
                    }

                    break;
                }
            }
            else
            {
                lblMessage.Text = "No Data Available For the CountryID = " + CountryID.ToString();
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
        finally
        {
            if (objConn.State == ConnectionState.Open)
                objConn.Close();
        }

    }
    #endregion FillCountryControls
  
}
