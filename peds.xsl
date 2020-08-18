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
				
				.content {
					width:900px;
					margin:auto;
				}
				
				.doctitle {
					margin-bottom:0em;
				}
				
				hr {
					margin:1em 0 2.5em 0;
					border: 1px dashed blue;
				}
				
				table {
					border:solid black 1px;
					margin-bottom:1em;
					width:900px;
				}
				
					caption {
						text-align:left;
						font-style:italic;
					}
				
					td {
						border-bottom:solid #dddddd 1px;
						padding-left:1ex;
						padding-right:1ex;
						vertical-align:top;
					}
					
					.rj {
						text-align:right;
					}
					
					.intreg {
						text-decoration: line-through;
					}
					
					.listtbl th, .blocktbl th {
						text-align:left;
						padding-left:1ex;
						color:#FFFFFF;
						background-color:#999999;
						font-style:italic;
					}
					
					.listtbl th, .listtbl td, .blocktbl th {
						padding-top:1ex;
						padding-bottom:1ex;
					}

					.blocktbl td {
						line-height:1.4em;
					}

					.grayrow {
						background-color:#f8f8f8;
					}
			</style>
		</head>
		
		<body>
			<div class="content">
				
				<xsl:for-each select="uspat:PatentData">
				
				  <!-- Application Data -->
				  <xsl:for-each select="uspat:PatentCaseMetadata">
					
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

					<xsl:variable name="pubnum">
						<xsl:choose>
							<xsl:when test="uscom:ApplicationTypeCategory = 'PCT'">
								WIPO Publication Number:
							</xsl:when>
							<xsl:otherwise>
								Earliest Publication No (PGPUB):
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>

					<xsl:variable name="pubdate">
						<xsl:choose>
							<xsl:when test="uscom:ApplicationTypeCategory = 'PCT'">
								WIPO Publication Date:
							</xsl:when>
							<xsl:otherwise>
								Earliest Publication Date:
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>

					<hr />
					<h2 class="doctitle"><xsl:value-of select="pat:InventionTitle"/></h2>
					<table class="blocktbl">
						<caption><h3>Application Data</h3></caption>
						<tr><td class="rj" width="25%">Application Number:</td><td width="25%"><xsl:value-of select="uscom:ApplicationNumberText"/></td><td class="rj" width="25%">Correspondence Address Customer Number:</td><td width="25%"><xsl:value-of select="uspat:PartyBag/com:CorrespondenceAddress/com:PartyIdentifier"/></td></tr>
						<tr><td class="rj">Filing or 371 (c) Date:</td><td><xsl:value-of select="pat:FilingDate"/></td><td class="rj">Status:</td><td><xsl:value-of select="uscom:ApplicationStatusCategory"/></td></tr>
						<tr><td class="rj">Application Type:</td><td><xsl:value-of select="uscom:ApplicationTypeCategory"/></td><td class="rj">Status Date:</td><td><xsl:value-of select="uscom:ApplicationStatusDate"/></td></tr>
						<tr><td class="rj">Examiner Name:</td><td><xsl:value-of select="uspat:PartyBag/pat:ExaminerBag/pat:PrimaryExaminer/com:Name/com:PersonName/com:PersonFullName"/></td><td class="rj">Location:</td><td><xsl:value-of select="uscom:OfficialFileLocationCategory"/></td></tr>
						<tr><td class="rj">Group Art Unit:</td><td><xsl:value-of select="uscom:GroupArtUnitNumber"/></td><td class="rj">Location Date:</td><td><xsl:value-of select="uscom:OfficialFileLocationDate"/></td></tr>
						<tr><td class="rj">Confirmation Number:</td><td><xsl:value-of select="uspat:ApplicationConfirmationNumber"/></td><td class="rj"><xsl:value-of select="$pubnum"/></td><td><xsl:if test="uscom:ApplicationTypeCategory = 'PCT'">WO</xsl:if><xsl:value-of select="uspat:PatentPublicationIdentification/pat:PublicationNumber"/></td></tr>
						<tr><td class="rj">Attorney Docket Number:</td><td><xsl:value-of select="com:ApplicantFileReference"/></td><td class="rj"><xsl:value-of select="$pubdate"/></td><td><xsl:value-of select="uspat:PatentPublicationIdentification/com:PublicationDate"/></td></tr>
						<tr><td class="rj">Class / Subclass:</td><td><xsl:value-of select="pat:PatentClassificationBag/pat:NationalClassification/pat:MainNationalClassification/pat:NationalClass"/>/<xsl:value-of select="pat:PatentClassificationBag/pat:NationalClassification/pat:MainNationalClassification/pat:NationalSubclass"/></td><td class="rj">Patent Number:</td><td><xsl:value-of select="uspat:PatentGrantIdentification/pat:PatentNumber"/></td></tr>
						<tr><td class="rj">Inventors:</td><td><xsl:for-each select="uspat:PartyBag/pat:InventorBag/pat:Inventor"><xsl:value-of select="com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:FirstName"/>&#160;<xsl:if test="com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:MiddleName != ''"><xsl:value-of select="com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:MiddleName"/>&#160;</xsl:if><xsl:value-of select="com:PublicationContact/com:Name/com:PersonName/com:PersonStructuredName/com:LastName"/><br /></xsl:for-each></td><td class="rj">Issue Date of Patent:</td><td><xsl:value-of select="uspat:PatentGrantIdentification/pat:GrantDate"/></td></tr>
						<tr><td class="rj">First Named Applicant:</td><td><xsl:value-of select="uspat:PartyBag/pat:ApplicantBag/pat:Applicant/com:PublicationContact/com:Name/com:OrganizationName/com:OrganizationStandardName"/></td><td class="rj">AIA (First Inventor to File):</td><td><xsl:value-of select="$first2file"/></td></tr>
						<tr><td class="rj intreg">International Registration Number (Hague):</td><td></td><td class="rj">Entity Status:</td><td><xsl:value-of select="uscom:BusinessEntityStatusCategory"/></td></tr>
						<tr><td class="rj intreg">International Registration Publication Date:</td><td></td><td></td></tr>
					</table>

				  </xsl:for-each>
				  
				  <!-- Transaction History -->
				  <xsl:for-each select="uspat:ProsecutionHistoryDataBag">
					<table class="listtbl">
						<caption><h3>Transaction History</h3></caption>
						<th width="20%">Date</th><th width="20%">Code</th><th width="60%">Transaction Description</th>
						<xsl:for-each select="uspat:ProsecutionHistoryData">
							<tr><td><xsl:value-of select="uspat:EventDate"/></td><td><xsl:value-of select="uspat:EventCode"/></td><td><xsl:value-of select="uspat:EventDescriptionText"/></td></tr>
						</xsl:for-each>
					</table>
				  </xsl:for-each>

				  <!-- TODO : Patent Term Adjustment tab -->

				  <!-- Correspondence Address -->
				  <xsl:for-each select="uspat:PatentCaseMetadata/uspat:PartyBag/com:CorrespondenceAddress">
					<table>
						<caption><h3>Correspondence Address</h3></caption>
						<tr><td>Name:</td><td><xsl:value-of select="com:Contact/com:Name/com:PersonName/com:PersonStructuredName/com:LastName"/></td></tr>
						<xsl:for-each select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalStructuredAddress">
							<xsl:variable name="cc">
								<xsl:choose>
									<xsl:when test="(com:CountryCode = 'US') or (com:CountryCode = 'null')">
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="com:CountryCode"/>,
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<tr><td>Address:</td><td><xsl:value-of select="com:AddressLineText"/>, <xsl:value-of select="com:CityName"/>, <xsl:value-of select="com:GeographicRegionName"/>, <xsl:value-of select="$cc"/><xsl:value-of select="com:PostalCode"/></td></tr>
						</xsl:for-each>
						<tr><td>Customer Number:</td><td><xsl:value-of select="com:PartyIdentifier"/></td></tr>
					</table>
				  </xsl:for-each>

				  <!-- Attorney/Agent Information -->
				  <xsl:for-each select="uspat:PatentCaseMetadata/uspat:PartyBag/uspat:RegisteredPractitionerBag">
					<table class="listtbl">
						<caption><h3>Attorney/Agent Information</h3></caption>
						<th width="20%">Reg#</th><th width="40%">Name</th><th width="40%">Phone</th>
						<xsl:for-each select="uspat:RegisteredPractitioner">
							<tr>
								<td><xsl:value-of select="pat:RegisteredPractitionerRegistrationNumber"/></td>
								<td><xsl:value-of select="com:Contact/com:Name"/><xsl:if test="@uscom:activeIndicator = 'false'">(not active)</xsl:if></td>
								<td><xsl:value-of select="com:Contact/com:PhoneNumberBag"/></td>
							</tr>
						</xsl:for-each>
					</table>
				  </xsl:for-each>

				  <!-- Continuity Data tab -->
				  <xsl:for-each select="uspat:PatentCaseMetadata/uspat:RelatedDocumentData">

					<table class="listtbl">
						<caption><h3>Parent Continuity Data</h3></caption>
						<th width="20%">Description</th><th width="16%">Parent Number</th><th width="16%">Parent Filing or 371(C) Date</th><th width="16%">AIA(First Inventor to File)</th><th width="16%">Parent Status</th><th width="16%">Patent Number</th>

						<!-- Test to check for node non-existance - suggested by a comment responding to the answer at https://stackoverflow.com/a/767873/8100489 -->
						<xsl:if test="not(uspat:ParentDocumentData/node())"><tr><td>No Parent Continuity Data Found.</td></tr></xsl:if>

						<xsl:for-each select="uspat:ParentDocumentData">
							<tr>
								<td><xsl:value-of select="uscom:DescriptionText"/></td>
								<td><xsl:value-of select="com:ApplicationNumberText"/></td>
								<td><xsl:value-of select="pat:FilingDate"/></td>
								<td><xsl:value-of select="uspat:AIAIndicator"/></td>
								<td><xsl:value-of select="pat:ParentDocumentStatusCode"/></td>
								<td><xsl:value-of select="pat:PatentNumber"/></td>
							</tr>
						</xsl:for-each>
					</table>

					<table class="listtbl">
						<caption><h3>Child Continuity Data</h3></caption>
						<!-- Test to check for node non-existance - suggested by a comment responding to the answer at https://stackoverflow.com/a/767873/8100489 -->
						<xsl:if test="not(uspat:ChildDocumentData/node())"><tr><td>No Child Continuity Data Found.</td></tr></xsl:if>
						<xsl:for-each select="uspat:ChildDocumentData">
							<tr><td><xsl:value-of select="com:ApplicationNumberText"/> filed on <xsl:value-of select="pat:FilingDate"/>&#160;<xsl:value-of select="uscom:DescriptionText"/></td></tr>
						</xsl:for-each>
					</table>

				  </xsl:for-each>

				  <!-- TODO : Foreign Priority tab -->

				  <!-- TODO : Assignments tab -->
				  <xsl:for-each select="uspat:AssignmentDataBag">
					<xsl:variable name="numassigns" select="@uspat:assignmentTotalQuantity"/>
					<xsl:for-each select="uspat:AssignmentData">
						<table class="blocktbl">
							<xsl:if test="position() = 1"><caption><h3>Patent Assignment Abstract of Title</h3></caption></xsl:if>
							<th colspan="4">Assignment: <xsl:value-of select="position()"/> of <xsl:value-of select="$numassigns"/></th>
							<tr><td width="20%" class="rj">Reel/Frame:</td><td width="*"><xsl:value-of select="uspat:ReelNumber"/>/<xsl:value-of select="uspat:FrameNumber"/></td><td width="20%" class="rj"></td><td width="20%"></td></tr>
							<tr><td class="rj">Pages</td><td><xsl:value-of select="com:PageTotalQuantity"/></td><td class="rj">Received date:</td><td><xsl:value-of select="com:DocumentReceivedDate"/></td></tr>
							<tr><td class="rj">Recorded date:</td><td><xsl:value-of select="uscom:RecordedDate"/></td><td class="rj">Mailed date:</td><td><xsl:value-of select="com:MailDate"/></td></tr>
							<tr><td class="rj">Conveyance:</td><td><xsl:value-of select="uscom:ConveyanceText"/></td><td class="rj"></td><td></td></tr>
							<xsl:for-each select="uspat:AssignorBag/uspat:Assignor">
								<tr class="grayrow"><td class="rj"><xsl:if test="position() = 1">Assignor:</xsl:if></td><td><xsl:value-of select="com:Contact"/></td><td class="rj">Exec Date:</td><td><xsl:value-of select="uscom:ExecutionDate"/></td></tr>
							</xsl:for-each>
							<xsl:for-each select="pat:AssigneeBag/pat:Assignee">
								<tr><td class="rj"><xsl:if test="position() = 1">Assignee:</xsl:if></td><td><xsl:value-of select="com:Contact/com:Name"/><br /><xsl:for-each select="com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalAddressText"><xsl:value-of select="."/><br /></xsl:for-each></td><td class="rj"></td><td></td></tr>
							</xsl:for-each>
							<tr class="grayrow"><td class="rj">Correspondent:</td><td><xsl:value-of select="com:CorrespondenceAddress/com:Contact/com:Name"/><br /><xsl:for-each select="com:CorrespondenceAddress/com:Contact/com:PostalAddressBag/com:PostalAddress/com:PostalAddressText"><xsl:value-of select="."/><br /></xsl:for-each></td><td class="rj"></td><td></td></tr>
						</table>
					</xsl:for-each>
				  </xsl:for-each>

				</xsl:for-each>

				<hr />
			</div>
		</body>
		
	</html>
</xsl:template>

</xsl:stylesheet>
