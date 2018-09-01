using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI.HtmlControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;


public partial class Transactions : System.Web.UI.Page
{
    String DCID;
    protected void Page_Load(object sender, EventArgs e)
    {
        DCID = (String)Session["DCID"];
        if (DCID.Equals(""))
        {
            Response.Redirect("Index.aspx");
        }
    }
    protected void btnIncome_Click(object sender, EventArgs e)
    {
        Response.ClearContent();
        Response.AddHeader("content-disposition", "attachment; filename=Income.xls");
        Response.ContentType = "application/ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        HtmlForm frm = new HtmlForm();
        GridView grd = gvIncome; 
        grd.Parent.Controls.Add(frm);
        frm.Attributes["runat"] = "server";
        frm.Controls.Add(grd);
        frm.RenderControl(htw);
        Response.Write(sw.ToString());
        Response.End();
    }
    protected void btnExpence_Click(object sender, EventArgs e)
    {
        Response.ClearContent();
        Response.AddHeader("content-disposition", "attachment; filename=Expense.xls");
        Response.ContentType = "application/ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        HtmlForm frm = new HtmlForm();
        GridView grd = gvExpense;
        grd.Parent.Controls.Add(frm);
        frm.Attributes["runat"] = "server";
        frm.Controls.Add(grd);
        frm.RenderControl(htw);
        Response.Write(sw.ToString());
        Response.End();
    }
    protected void btnIncomeExpence_Click(object sender, EventArgs e)
    {
        Response.ClearContent();
        Response.AddHeader("content-disposition", "attachment; filename=IncomeExpense.xls");
        Response.ContentType = "application/ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        HtmlForm frm = new HtmlForm();
        GridView grd = gvIncomeExpense;
        grd.Parent.Controls.Add(frm);
        frm.Attributes["runat"] = "server";
        frm.Controls.Add(grd);
        frm.RenderControl(htw);
        Response.Write(sw.ToString());
        Response.End();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView GridView1 = gvIncome;
        GridView1.AllowPaging = false;
        GridView1.DataBind();
        iTextSharp.text.Table table = new iTextSharp.text.Table(GridView1.Columns.Count);
        table.Cellpadding = 5;
        for (int x = 0; x < GridView1.Columns.Count; x++)
        {
            String cellText = Server.HtmlDecode(GridView1.HeaderRow.Cells[x].Text);
            iTextSharp.text.Cell cell = new iTextSharp.text.Cell(cellText);
            cell.BackgroundColor = new Color(System.Drawing.ColorTranslator.FromHtml("#1C5E55"));               
            table.AddCell(cell);
        }       
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            if (GridView1.Rows[i].RowType == DataControlRowType.DataRow)
            {
                for (int j = 0; j < GridView1.Columns.Count; j++)
                {
                    string cellText = Server.HtmlDecode(GridView1.Rows[i].Cells[j].Text);
                    iTextSharp.text.Cell cell = new iTextSharp.text.Cell(cellText);
                    if(i % 2 != 0)
                    {
                        cell.BackgroundColor = new Color(System.Drawing.ColorTranslator.FromHtml("#E3EAEB"));
                    }
                    table.AddCell(cell);
                }
            }
        }       
        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        pdfDoc.Add(table);
        pdfDoc.Close();
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=Income.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Write(pdfDoc);
        Response.End();
        
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        GridView GridView1 = gvExpense;
        GridView1.AllowPaging = false;
        GridView1.DataBind();
        iTextSharp.text.Table table = new iTextSharp.text.Table(GridView1.Columns.Count);
        table.Cellpadding = 5;
        for (int x = 0; x < GridView1.Columns.Count; x++)
        {
            String cellText = Server.HtmlDecode(GridView1.HeaderRow.Cells[x].Text);
            iTextSharp.text.Cell cell = new iTextSharp.text.Cell(cellText);
            cell.BackgroundColor = new Color(System.Drawing.ColorTranslator.FromHtml("#990000"));
            table.AddCell(cell);
        }
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            if (GridView1.Rows[i].RowType == DataControlRowType.DataRow)
            {
                for (int j = 0; j < GridView1.Columns.Count; j++)
                {
                    string cellText = Server.HtmlDecode(GridView1.Rows[i].Cells[j].Text);
                    iTextSharp.text.Cell cell = new iTextSharp.text.Cell(cellText);
                    if (i % 2 != 0)
                    {
                        cell.BackgroundColor = new Color(System.Drawing.ColorTranslator.FromHtml("#FFFBD6"));
                    }
                    table.AddCell(cell);
                }
            }
        }
        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        pdfDoc.Add(table);
        pdfDoc.Close();
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=Expense.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Write(pdfDoc);
        Response.End();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        GridView GridView1 = gvIncomeExpense;
        GridView1.AllowPaging = false;
        GridView1.DataBind();
        iTextSharp.text.Table table = new iTextSharp.text.Table(GridView1.Columns.Count);
        table.Cellpadding = 5;
        for (int x = 0; x < GridView1.Columns.Count; x++)
        {
            String cellText = Server.HtmlDecode(GridView1.HeaderRow.Cells[x].Text);
            iTextSharp.text.Cell cell = new iTextSharp.text.Cell(cellText);
            cell.BackgroundColor = new Color(System.Drawing.ColorTranslator.FromHtml("#6B696B"));
            table.AddCell(cell);
        }
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            if (GridView1.Rows[i].RowType == DataControlRowType.DataRow)
            {
                for (int j = 0; j < GridView1.Columns.Count; j++)
                {
                    string cellText = Server.HtmlDecode(GridView1.Rows[i].Cells[j].Text);
                    iTextSharp.text.Cell cell = new iTextSharp.text.Cell(cellText);
                    if (i % 2 != 0)
                    {
                        cell.BackgroundColor = new Color(System.Drawing.ColorTranslator.FromHtml("#F7F7DE"));
                    }
                    table.AddCell(cell);
                }
            }
        }
        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        pdfDoc.Add(table);
        pdfDoc.Close();
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=IncomeExpense.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Write(pdfDoc);
        Response.End();
    }
}