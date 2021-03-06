<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>


<form class='form-horizontal internetSettingForm' role="form" data-toggle="validator">

	<div class='container'>
		<ul class='nav nav-pills'>
			<li class='active'><a href='#portTab' data-toggle='tab'>Port 設定</a></li>
			<li><a href='#dhcpTab' data-toggle='tab'>DHCP 設定</a></li>
			<li><a href='#wanTab' data-toggle='tab'>WAN 設定</a></li>
			<li><a href='#ipsecTab' data-toggle='tab'>IPsec 設定</a></li>
			<li><a href='#lanTab' data-toggle='tab'>LAN 設定</a></li>
		</ul>

		<div class='tab-content clearfix'>
			
			<!-- Port -->
			<div class='tab-pane active' id='portTab'>
				<h3>請設定你的Port接口</h3>
				
				<table id='tablePortList' class="table table-striped table-bordered" cellspacing="0" width="100%">
				
				</table>
				<br>
				
			</div>
			
			<!-- DHCP -->
			<div class='tab-pane' id='dhcpTab'>
				<h3>請設定你的DHCP</h3>
				
				<div class='form-group'>
					<label for='dhcpDns1' class='col-sm-2 control-label'>DNS1</label>
					<div class='col-sm-10'>
						<input type='text' class='form-control' id='dhcpDns1'
							name='dhcpDns1' value='${dhcpInfo.dns1}'>
					</div>
				</div>
				<div class='form-group'>
					<label for='dhcpDns2' class='col-sm-2 control-label'>DNS2</label>
					<div class='col-sm-10'>
						<input type='text' class='form-control' id='dhcpDns2' name='dhcpDns2'
							value='${dhcpInfo.dns2}'>
					</div>
				</div>
				<div class='form-group'>
					<label for='subnet' class='col-sm-2 control-label'>Subnet</label>
					<div class='col-sm-10'>
						<input type='text' class='form-control' id='subnet' name='subnet'
							value='${dhcpInfo.subnet}'>
					</div>
				</div>
				<div class='form-group'>
					<label for='netmask' class='col-sm-2 control-label'>Netmask</label>
					<div class='col-sm-10'>
						<input type='text' class='form-control' id='netmask' name='netmask'
							value='${dhcpInfo.netmask}'>
					</div>
				</div>
				<div class='form-group'>
					<label for='startIP' class='col-sm-2 control-label'>Start IP</label>
					<div class='col-sm-10'>
						<input type='text' class='form-control' id='startIP' name='startIP'
							value='${dhcpInfo.startIp}'>
					</div>
				</div>
				<div class='form-group'>
					<label for='endIP' class='col-sm-2 control-label'>End IP</label>
					<div class='col-sm-10'>
						<input type='text' class='form-control' id='endIP' name='endIP'
							value='${dhcpInfo.endIp}'>
					</div>
				</div>
				<div class='form-group'>
					<label for='defaultGatewayForDhcp' class='col-sm-2 control-label'>Default Gateway</label>
					<div class='col-sm-10'>
						<input type='text' class='form-control' id='defaultGatewayForDhcp' name='defaultGatewayForDhcp'
							value='${dhcpInfo.defaultGateway}'>
					</div>
				</div>
				
				<div class='form-group'>
					<div class='col-sm-offset-11 col-sm-1'>
						<input class='btn btn-default btnSubmit' type='button' value='發送'>
					</div>
				</div>
				
			</div>
			
			<!-- WAN -->
			<div class='tab-pane' id='wanTab'>
				<h3>請設定你的WAN</h3>
				
				<div class='form-group'>
					<div class='pull-right'>
						<input class='btn btn-default btnCreateWan ' type='button' value='新增WAN'>
					</div>
				</div>
				<table id='tableWanList' class="table table-striped table-bordered" cellspacing="0" width="100%">
				
				</table>
				<br>
				
			</div>
			
			<!-- IPsec -->
			<div class='tab-pane' id='ipsecTab'>
				<h3>請設定你的IPsec</h3>
				
				<div class='form-group'>
						<div class='pull-right'>
						<input class='btn btn-default btnCreateIpsec' type='button' value='新增IPsec'>
					</div>
				</div>
				
				<table id='tableIpsecList' class="table table-striped table-bordered" cellspacing="0" width="100%">
				
				</table>
				<br>
				
			</div>

			<!-- LAN -->
			<div class='tab-pane' id='lanTab'>
				<h3>請設定你的LAN</h3>
				
				<div class='form-group'>
					<label for='lanIp' class='col-sm-2 control-label'>LAN IP</label>
					<div class='col-sm-10'>
						<input type='text' class='form-control' id='lanIp'
							name='lanIp' value='${lanInfo.ip}' required>
					</div>
				</div>
				
				<div class='form-group'>
					<label for='lanSubnetMask' class='col-sm-2 control-label'>Subnet mask</label>
					<div class='col-sm-10'>
						<input type='text' class='form-control' id='lanSubnetMask'
							name='lanSubnetMask' value='${lanInfo.subnetMask}'>
					</div>
				</div>
				
				<!-- port id checkbox -->
				<c:forEach var="sortedPortIdVoList" items="${sortedPortIdVoList}">
					<c:choose>
						<c:when test="${sortedPortIdVoList.portIdValue == 0}">
							<div class='form-group'>
								<label for='lanPortMutiIdCheckbox${sortedPortIdVoList.index}' class='col-sm-2 control-label'>Port : ${sortedPortIdVoList.portName}</label>
								<div class='col-sm-10'>
									<input type='checkbox' class='form-control' id='lanPortMutiIdCheckbox${sortedPortIdVoList.index}'
										value='${sortedPortIdVoList.index}' >
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class='form-group'>
								<label for='lanPortMutiIdCheckbox${sortedPortIdVoList.index}' class='col-sm-2 control-label'>Port : ${sortedPortIdVoList.portName}</label>
								<div class='col-sm-10'>
									<input type='checkbox' class='form-control' id='lanPortMutiIdCheckbox${sortedPortIdVoList.index}'
										 value='${sortedPortIdVoList.index}' checked>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
					
				</c:forEach>
				
				<div class='form-group'>
					<div class='col-sm-offset-11 col-sm-1'>
						<input class='btn btn-default btnSubmit' type='button' value='發送'>
					</div>
				</div>
				
				
			</div>
			
		</div>
		
		
	</div>

</form>

<!-- including js -->
<script src='<c:url value='/resources/js/internetSetting.js' />'></script>
<%-- <script src='<c:url value='https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js' />'></script> --%>
<%-- <script src='<c:url value='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/bootstrap-table.min.js' />'></script> --%>
<%-- <script src='<c:url value='/resources/js/validator/validator.js' />'></script> --%>
<%-- <script src='<c:url value='/resources/js/bootbox/bootboxForm.js' />'></script> --%>
