﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sitelink.aspx.cs" Inherits="manger_mlink_sitelink" %>
<%@ Register assembly="AspNetPager" namespace="Wuqi.Webdiyer" tagprefix="webdiyer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>软件特色专业</title>
    <link href="../images/skin.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 112px;
        }
        .style2
        {
            width: 132px;
        }
        .style3
        {
            width: 105px;
        }
        .style4
        {
            width: 131px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="../images/mail_leftbg.gif"><img src="../images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="../images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">友情链接</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="../images/mail_rightbg.gif"><img src="../images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="../images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9">
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top">&nbsp;
<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0" bordercolorlight="#999999" bordercolordark="#FFFFFF" class="newtable">
      <tr>
        <td colspan="6" style="background:#bfd3e6; text-align:left">&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="Button1" type="button" value="添加友情链接" style="height:25px" onclick="location='addlink.aspx';" />
          </td>
      </tr>
      <tr>
      <td colspan="6" height="5px"></td>
      </tr>
	  <tr style=" font-size:14px;" id="titleone">
	    <td width="20%" align="center" bgcolor="#e1e5ee">网站名称</td>
		<td align="center" bgcolor="#e1e5ee" class="style4">网站地址</td>
		<td align="center" bgcolor="#e1e5ee" class="style2">添加时间</td>
		<td align="center" bgcolor="#e1e5ee" class="style3">审核通过</td>
		<td align="center" bgcolor="#e1e5ee" class="style1">排序</td>
		<td width="15%" align="center" bgcolor="#e1e5ee">操作</td>
	  </tr>
	  <asp:Repeater ID="rptNewslist" runat="server" 
          onitemcommand="rptNewslist_ItemCommand">
      <ItemTemplate>
      <asp:HiddenField ID="hdfId" runat="server" Value='<%#Eval("link_id")%>' />
	  <tr onmouseover="this.style.backgroundColor='#e1e5ee';" onmouseout="this.style.backgroundColor='';">
		<td align="center">&nbsp;<%# Eval("site_name") %></td>
		<td align="left">&nbsp;<%#Eval("site_url")%></td>
		<td align="left">&nbsp;<%#Eval("site_createtime")%></td>
		<td align="center">&nbsp;<asp:LinkButton ID="lbtshenhe" Text='<%#Getshenhe(Eval("site_shenhe"))%>' ForeColor='<%#GetshenheColor(Eval("site_shenhe"))%>' runat="server" CommandName='<%#Eval("site_shenhe") %>' CommandArgument='<%#Eval("link_id") %>'></asp:LinkButton></td>
		<td align="center">
		<asp:ImageButton ID="ibtUp" runat="server" ImageUrl="../images/order_up.gif" OnClientClick="if(this.src.substr(this.src.lastIndexOf('/'))=='/order_up_no.gif') return false;" CommandArgument='<%#Eval("link_id") %>' CommandName="OrderUp" check="false" />
		&nbsp;
		<asp:ImageButton ID="ibtDown" runat="server" ImageUrl="../images/order_down.gif" OnClientClick="if(this.src.substr(this.src.lastIndexOf('/'))=='/order_down_no.gif') return false;" CommandArgument='<%#Eval("link_id") %>' CommandName="OrderDown" check="false" />
		</td>
		<td align="center">
		<a href="addlink.aspx?id=<%#Eval("link_id") %>">修改</a> | <asp:LinkButton ID="LinkButton1" runat="server" CommandName="delete" CommandArgument='<%#Eval("link_id") %>' OnClientClick="return confirm('确认删除吗?')">删除</asp:LinkButton>
		</td>
	  </tr>
	  </ItemTemplate>
      </asp:Repeater>
      <tr>
		<td colspan="6" align="center">
            <webdiyer:AspNetPager ID="AspNetPager1" runat="server" 
                onpagechanged="AspNetPager1_PageChanged" PageSize="15" Width="90%">
            </webdiyer:AspNetPager>
            &nbsp;
        </td>
	  </tr>
</table>
        
        </td>
      </tr>
    </table></td>
    <td background="../images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="bottom" background="../images/mail_leftbg.gif"><img src="../images/buttom_left2.gif" width="17" height="17" /></td>
    <td background="../images/buttom_bgs.gif"><img src="../images/buttom_bgs.gif" width="17" height="17"></td>
    <td valign="bottom" background="../images/mail_rightbg.gif"><img src="../images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
    </form>
</body>
</html>
