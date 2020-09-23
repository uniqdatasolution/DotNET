<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:udf="urn:my-scripts">
	<msxsl:script language="C#" implements-prefix="udf">
		<![CDATA[  
				public string getDate() 
				{ 
					return DateTime.Now.ToString("ddd MMM dd, yyyy hh:mm:ss");  
				}
		]]>
	</msxsl:script>
	<xsl:output method="html" indent="yes" omit-xml-declaration="yes"/>
	<xsl:variable name="vGetDate" select="udf:getDate()"/>

	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<title>
					<xsl:value-of select="SVTWebException/@ApplicationName"/> HDFC PORTAL - Error Notification
				</title>
				<style type="text/css">
					.MessageTitle{font-family: Verdana; font-size:14px; font-weight:bold; color: #ffffff;}
					.Notes{font-family: verdana; font-size:12px;}
					.DataTitle{font-family: arial; font-size:14px; font-weight:bold}
					.DataValue{font-family: arial; font-size:13px;}
					.ExceptionMessage{font-family: arial; font-size:15px; color:#ad0000}
					.TblTitle{background-color: #333399;}
					.TblDetails{background-color: #003399;}
				</style>
			</head>
			<body>
				<table width="100%">
					<tr>
						<td>
							<table class="TblDetails" cellspacing="1" cellpadding="1" width="100%" align="left" border="0">
								<tr>
									<td width="100%" align="center" colspan="2">
										<table width="100%" align="center" border="0">
											<tr>
												<td class="MessageTitle" align="center" width="100%">
													<xsl:value-of select="SVTWebException/@ApplicationName"/> HDFC PORTAL - Error Notification
                        </td>
											</tr>
										</table>
									</td>
								</tr>
								<tr bgcolor="#ffffff">
									<td class="DataTitle" width="15%">URL</td>
									<td class="DataValue">
										<xsl:value-of select="SVTWebException/@AppUrl"/>
									</td>
								</tr>
								<tr bgcolor="#ffffff">
									<td class="DataTitle">UserName</td>
									<td class="DataValue">
										<xsl:value-of select="SVTWebException/@UserName"/>
									</td>
								</tr>
								<tr bgcolor="#ffffff">
									<td class="DataTitle">Remote Address</td>
									<td class="DataValue">
										<xsl:value-of select="SVTWebException/@RemoteHost"/>
									</td>
								</tr>
								<tr bgcolor="#ffffff">
									<td class="DataTitle">Exception</td>
									<td class="DataValue">
										<xsl:call-template name="ExceptionTemplate">
											<xsl:with-param name="Exception" select="/SVTWebException/SVTException"></xsl:with-param>
						<xsl:with-param name="ShowRequestData" select="SVTWebException/RequestVariables"></xsl:with-param>
						<xsl:with-param name="ShowSessionData" select="SVTWebException/SessionVariables"></xsl:with-param>
											<xsl:with-param name="ShowStacktrace" select="1"></xsl:with-param>
										</xsl:call-template>
									</td>
								</tr>
								
							</table>
						</td>
					</tr>
					<tr>
						<td height="30"></td>
					</tr>
					<tr>
						<td>
							<table cellspacing="1" cellpadding="1" width="100%" align="center" bgcolor="#adadad" border="0">
								<tr>
									<td>
										<div style="background-color: #adadad; text-align: center">
											<span class="Notes">
												This is an automated mail sent by the interface. Please do not reply
												to this mail. Please send your comments to <a href="mailto:headofheads@gmail.com;"
										style="text-decoration: none; color: blue">headofheads@gmail.com</a><br/>
												This mail was generated on [ <xsl:value-of select="$vGetDate"/> ]
											</span>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>


			</body>
		</html>
	</xsl:template>

	<xsl:template name="ExceptionTemplate">
		<xsl:param name="Exception"></xsl:param>
		<xsl:param name="ShowStacktrace"></xsl:param>
	<xsl:param name="ShowRequestData"></xsl:param>
	<xsl:param name="ShowSessionData"></xsl:param>
	
		<table class="TblDetails" cellspacing="1" cellpadding="1" width="100%" align="left" border="1">
			<tr bgcolor="#ffffff" height="40px" valign="middle">
				<td class="DataTitle" align="left" width="15%">Error Message</td>
				<td class="ExceptionMessage">
					<xsl:value-of select="$Exception/ErrorMessage"/>
				</td>
			</tr>
			<tr bgcolor="#ffffff">
				<td class="DataTitle" align="left" valign="top">Browser Detail</td>
				<td class="DataValue">
					<xsl:call-template name="CustomDetails">
						<xsl:with-param name="CustomDetails" select="$Exception/CustomDetails"></xsl:with-param>
					</xsl:call-template>
				</td>
			</tr>
		 <!--<tr bgcolor="#ffffff">
				<td class="DataTitle" align="left">Request Variables</td>
				<td class="DataValue">
			<xsl:call-template name="RequestInfo">
						<xsl:with-param name="RequestInfo" select="$ShowRequestData"></xsl:with-param>
					</xsl:call-template>
				</td>
			</tr>-->
		<tr bgcolor="#ffffff">
				<td class="DataTitle" align="left">Session Variables</td>
				<td class="DataValue">
			<xsl:call-template name="SessionInfo">
						<xsl:with-param name="SessionInfo" select="$ShowSessionData"></xsl:with-param>
					</xsl:call-template>
				</td>
			</tr>
			<tr bgcolor="#ffffff">
				<td class="DataTitle" align="left">Exception Type</td>
				<td class="DataValue">
					<xsl:value-of select="$Exception/ExceptionType"/>
				</td>
			</tr>
			<xsl:if test="$Exception/SVTInnerException != ''">
				<tr bgcolor="#ffffff">
					<td class="DataTitle" align="left" valign="top">Inner Exception</td>
					<td class="DataValue">
						<xsl:call-template name="ExceptionTemplate">
							<xsl:with-param name="Exception" select="$Exception/SVTInnerException"></xsl:with-param>
							<xsl:with-param name="ShowRequestData" select="SVTWebException/CustomDetails"></xsl:with-param>
							<xsl:with-param name="ShowSessionData" select="SVTWebException/ExceptionType"></xsl:with-param>
							<xsl:with-param name="ShowStacktrace" select="0"></xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<tr bgcolor="#ffffff">
				<td class="DataTitle" align="left">Target Site</td>
				<td class="DataValue">
					<xsl:value-of select="$Exception/TargetSite"/>
				</td>
			</tr>
			<xsl:if test="//StackTrace != '' and $ShowStacktrace = '1'">
				<tr bgcolor="#ffffff">
					<td class="DataTitle" align="left" valign="top">Stack Trace</td>
					<td class="DataValue">
						<div align="justify">
							<xsl:call-template name="PreserveLineBreaks">
								<xsl:with-param name="text" select="//StackTrace"/>
							</xsl:call-template>
						</div>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<xsl:template name="CustomDetails">
		<xsl:param name="CustomDetails"></xsl:param>
		<table width="98%" align="left" border="0" cellpadding="1" cellspacing="1">
			<xsl:for-each select="$CustomDetails/CustomDetail">
				<tr bgcolor="#ffffff">
					<!--<td class="DataTitle" width="20%">
						<xsl:value-of select="@Key"/>
					</td>-->
					<td class="DataValue">
						<xsl:value-of select="@Value"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<xsl:template name="RequestInfo">
		<xsl:param name="RequestInfo"></xsl:param>
		<table width="98%" align="left" border="0" cellpadding="1" cellspacing="1">
			<xsl:for-each select="$RequestInfo/RequestVariable">
				<tr bgcolor="#ffffff">
					<td class="DataTitle" width="20%">
						<xsl:value-of select="@Key"/>
					</td>
					<td class="DataValue">
						<xsl:value-of select="@Value"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<xsl:template name="SessionInfo">
		<xsl:param name="SessionInfo"></xsl:param>
		<table width="98%" align="left" border="0" cellpadding="1" cellspacing="1">
			<xsl:for-each select="$SessionInfo/SessionVariable">
				<tr bgcolor="#ffffff">
					<td class="DataTitle" width="20%">
						<xsl:value-of select="@Key"/>
					</td>
					<td class="DataValue">
						<xsl:value-of select="@Value"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	
	
	<xsl:template name="PreserveLineBreaks">
		<xsl:param name="text"/>
		<xsl:choose>
			<xsl:when test="contains($text,'&#xA;')">
				<xsl:value-of select="substring-before($text,'&#xA;')"/>
				<br/>
				<xsl:call-template name="PreserveLineBreaks">
					<xsl:with-param name="text">
						<xsl:value-of select="substring-after($text,'&#xA;')"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>