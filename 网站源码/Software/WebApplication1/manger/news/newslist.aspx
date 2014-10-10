﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newslist.aspx.cs" Inherits="manger_news_newslist" %>
<%@ Register assembly="AspNetPager" namespace="Wuqi.Webdiyer" tagprefix="webdiyer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>软件特色专业</title>
    <link href="../images/skin.css" rel="stylesheet" type="text/css" />
    <link href="../css/zhoukang.css" rel="stylesheet" type="text/css">
    <script src="../../js/checkform.js" type="text/javascript"></script>
    </head>
<body>
<form id="form1" runat="server">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="../images/mail_leftbg.gif"><img src="../images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="../images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">
            <asp:Label ID="lbltitle" runat="server" Text="lbltitle"></asp:Label></div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="../images/mail_rightbg.gif"><img src="../images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="../images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top">&nbsp;
<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0" bordercolorlight="#999999" bordercolordark="#FFFFFF" class="newtable">
      <tr>
        <td colspan="7" style="background:#bfd3e6; text-align:left">&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;            
            &nbsp;
             <asp:CheckBox ID="chkshow" runat="server" Text="前台显示" /> &nbsp;
            <asp:CheckBox ID="chkrem" runat="server" Text="推荐" />
            &nbsp;
              搜索关键字：<input id="key" type="text" runat="server" size="35" maxlength="100" onfocus="getb(this)" onblur="getbno(this)" />&nbsp;<asp:Button 
                ID="btnQuery" runat="server" Text="搜索" Height="25px" 
                onclick="btnQuery_Click" />
          </td>
      </tr>
      <tr>
      <td colspan="7" height="5px"></td>
      </tr>
	  <tr style=" font-size:14px;" id="titleone">
		<td width="25%" align="center" bgcolor="#e1e5ee">标题</td>
		<td width="10%" align="center" bgcolor="#e1e5ee">新闻类别</td>
		<td width="15%" align="center" bgcolor="#e1e5ee">加入时间</td>
		<td width="10%" align="center" bgcolor="#e1e5ee">前台显示</td>
		<td width="10%" align="center" bgcolor="#e1e5ee">推荐</td>
		<td width="20%" align="center" bgcolor="#e1e5ee">排序</td>	
		<td width="10%" align="center" bgcolor="#e1e5ee">操作</td>
	  </tr>
	  <asp:Repeater ID="rptNewslist" runat="server" 
          onitemcommand="rptNewslist_ItemCommand">
      <ItemTemplate>
	  <tr onmouseover="this.style.backgroundColor='#e1e5ee';" onmouseout="this.style.backgroundColor='';">
		<td align="center" style=" font-size:12px;">&nbsp;<%#Common.GetContentSummary(Eval("news_name").ToString(),20,false)%></td>
		<td align="center" style=" font-size:12px;">&nbsp;<%# getname(Convert.ToInt32(Eval("news_type")))%></td>
		<td align="center" style=" font-size:12px;">&nbsp;<%#Eval("news_createtime")%></td>
		<td align="center">&nbsp;<asp:LinkButton ID="lbtshenhe" Text='<%#Getshenhe(Eval("news_isshow"))%>' ForeColor='<%#GetshenheColor(Eval("news_isshow"))%>' runat="server" CommandName='<%#Eval("news_isshow") %>' CommandArgument='<%#Eval("news_id") %>'></asp:LinkButton></td>
		<td align="center">&nbsp;<asp:LinkButton ID="LinkButton2" Text='<%#Getrem(Eval("news_recommand"))%>' ForeColor='<%#GetremColor(Eval("news_recommand"))%>' runat="server" CommandName='rem' CommandArgument='<%#Eval("news_id") %>'></asp:LinkButton></td>
		<td align="center">
		<%--<asp:LinkButton ID="idTop" runat="server"  CommandArgument='<%#Eval("news_id") %>' CommandName="OrderTop">置 顶</asp:LinkButton>&nbsp;&nbsp;--%>
		<asp:ImageButton ID="idTop" runat="server" ImageUrl="../images/order_top.gif" OnClientClick="if(this.src.substr(this.src.lastIndexOf('/'))=='/order_top_no.gif') return false;"  CommandArgument='<%#Eval("news_id") %>' CommandName="OrderTop" check="false"/>
		&nbsp;&nbsp;
		<asp:ImageButton ID="ibtUp" runat="server" ImageUrl="../images/order_up.gif" OnClientClick="if(this.src.substr(this.src.lastIndexOf('/'))=='/order_up_no.gif') return false;" CommandArgument='<%#Eval("news_id") %>' CommandName="OrderUp" check="false" />
		&nbsp;
		<asp:ImageButton ID="ibtDown" runat="server" ImageUrl="../images/order_down.gif" OnClientClick="if(this.src.substr(this.src.lastIndexOf('/'))=='/order_down_no.gif') return false;" CommandArgument='<%#Eval("news_id") %>' CommandName="OrderDown" check="false" />
		&nbsp;&nbsp;
		<asp:ImageButton ID="idEnd" runat="server" ImageUrl="../images/order_end.gif" OnClientClick="if(this.src.substr(this.src.lastIndexOf('/'))=='/order_end_no.gif') return false;" CommandArgument='<%#Eval("news_id") %>' CommandName="OrderEnd" check="false"/> 
		<%--<asp:LinkButton ID="idEnd" runat="server"  CommandArgument='<%#Eval("news_id") %>' CommandName="OrderEnd">置 底</asp:LinkButton>--%>
		
		</td>
		<td align="center" style="font-size:12px;">
		<a href="addnews.aspx?id=<%#Eval("news_id") %>&tid=<%#Eval("news_type") %>">修改</a> | <asp:LinkButton ID="LinkButton1" runat="server" CommandName="delete" CommandArgument='<%#Eval("news_id") %>' OnClientClick="return confirm('确认删除吗?')">删除</asp:LinkButton>
		</td>
	  </tr>
	  </ItemTemplate>
      </asp:Repeater>
      <tr>
		<td colspan="7" align="center">
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
