<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pat="http://www.wipo.int/standards/XMLSchema/ST96/Patent" xmlns:uscom="urn:us:gov:doc:uspto:common" xmlns:uspat="urn:us:gov:doc:uspto:patent" xmlns:com="http://www.wipo.int/standards/XMLSchema/ST96/Common" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

<!--
    peds.xsl - Patent Examination Data System XSLT Transform Stylesheet

    Copyright © 2020 David Yockey

    This file is part of XSLT_PEDS.

    XSLT_PEDS is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    XSLT_PEDS is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with XSLT_PEDS.  If not, see <https://www.gnu.org/licenses/>.
-->

<xsl:template match="/uspat:PatentBulkData">
	<html>
		
		<head>
			<style>
				body {
					font-family:sans-serif;
				}
				
				.doctitle {
					margin-top:2em;
					margin-bottom:0em;
				}
				
				table {
					border:solid black 1px;
					margin-bottom:1em;
					width:1200px;
				}
				
					caption {
						text-align:left;
						font-style:italic;
					}
				
					td {
						border-bottom:solid #dddddd 1px;
					}
					
					.intreg {
						text-decoration: line-through;
					}
			</style>
		</head>
		
		<body>
			<xsl:apply-templates/>
		</body>
		
	</html>
</xsl:template>

<xsl:template match="uspat:PatentCaseMetadata">
	
	<xsl:variable name="first2file">
		<xsl:choose>
			<xsl:when test="uspat:FirstInventorToFileIndicator = 'false'">
				No
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="uspat:FirstInventorToFileIndicator = 'true'">
						Yes
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="uspat:FirstInventorToFileIndicator"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	
	<h2 class="doctitle"><xsl:value-of select="pat:InventionTitle"/></h2>
	<table>
		<caption><h3>Application Data</h3></caption>
		<tr><td width="25%">Application Number:</td><td width="25%"><xsl:value-of select="uscom:ApplicationNumberText"/></td><td width="25%">Correspondence Address Customer Number:</td><td width="25%"><xsl:value-of select="uspat:PartyBag/com:CorrespondenceAddress/com:PartyIdentifier"/></td></tr>
		<tr><td>Filing or 371 (c) Date:</td><td><xsl:value-of select="pat:FilingDate"/></td><td>Status:</td><td><xsl:value-of select="uscom:ApplicationStatusCategory"/></td></tr>
		<tr><td>Application Type:</td><td><xsl:value-of select="uscom:ApplicationTypeCategory"/></td><td>Status Date:</td><td><xsl:value-of select="uscom:ApplicationStatusDate"/></td></tr>
		<tr><td>Examiner Name:</td><td><xsl:value-of select="uspat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonFullName"/></td><td>Location:</td><td><xsl:value-of select="uscom:OfficialFileLocationCategory"/></td></tr>
		<tr><td>Group Art Unit:</td><td><xsl:value-of select="uscom:GroupArtUnitNumber"/></td><td>Location Date:</td><td><xsl:value-of select="uscom:OfficialFileLocationDate"/></td></tr>
		<tr><td>Confirmation Number:</td><td><xsl:value-of select="uspat:ApplicationConfirmationNumber"/></td><td>Earliest Publication No (PGPUB):</td><td><xsl:value-of select="uspat:PatentPublicationIdentification/pat:PublicationNumber"/></td></tr>
		<tr><td>Attorney Docket Number:</td><td><xsl:value-of select="com:ApplicantFileReference"/></td><td>Earliest Publication Date:</td><td><xsl:value-of select="uspat:PatentPublicationIdentification/com:PublicationDate"/></td></tr>
		<tr><td>Class / Subclass:</td><td><xsl:value-of select="pat:PatentClassificationBag/pat:NationalClassification/pat:MainNationalClassification/pat:NationalClass"/>/<xsl:value-of select="pat:PatentClassificationBag/pat:NationalClassification/pat:MainNationalClassification/pat:NationalSubclass"/></td><td>Patent Number:</td><td><xsl:value-of select="uspat:PatentGrantIdentification/pat:PatentNumber"/></td></tr>
		<tr><td>Inventors:</td><td><xsl:for-each select="uspat:PartyBag/pat:InventorBag/pat:Inventor"><xsl:value-of select="com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:FirstName"/>&#160;<xsl:if test="com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:MiddleName != ''"><xsl:value-of select="com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:MiddleName"/>&#160;</xsl:if><xsl:value-of select="com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:LastName"/><br /></xsl:for-each></td><td>Issue Date of Patent:</td><td><xsl:value-of select="uspat:PatentGrantIdentification/pat:GrantDate"/></td></tr>
		<tr><td>First Named Applicant:</td><td><xsl:value-of select="uspat:PartyBag/pat:ApplicantBag/pat:Applicant/com:PublicationContact/com:Name/com:OrganizationName/com:OrganizationStandardName"/></td><td></td><td></td></tr>
		<tr><td class="intreg">International Registration Number (Hague):</td><td></td><td>AIA (First Inventor to File):</td><td><xsl:value-of select="$first2file"/></td></tr>
		<tr><td class="intreg">International Registration Publication Date:</td><td></td><td>Entity Status:</td><td><xsl:value-of select="uscom:BusinessEntityStatusCategory"/></td></tr>
	</table>
	
</xsl:template>

<xsl:template match="uspat:ProsecutionHistoryDataBag">
</xsl:template>

<xsl:template match="uspat:PatentTermData">
</xsl:template>

<xsl:template match="uspat:AssignmentDataBag">
</xsl:template>

</xsl:stylesheet>
