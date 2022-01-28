<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
	</div>

	<!-- Content Row -->
	<div class="row">

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Pendaftar</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800"><?= $participant ?></div>
						</div>
						<div class="col-auto">
							<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<!-- <div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-success text-uppercase mb-1">Antigen</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800"><?= $antigen ?></div>
						</div>
						<div class="col-auto">
							<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div> -->

		<!-- Earnings (Monthly) Card Example -->
		<!-- <div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-info shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-info text-uppercase mb-1">Kehadiran</div>
							<div class="row no-gutters align-items-center">
								<div class="col-auto">
									<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"><?= $attendance ?></div>
								</div>
							</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div> -->

		<!-- Pending Requests Card Example -->
		<!-- <div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-warning shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Tidak Hadir</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800"><?= $not_attend ?></div>
						</div>
						<div class="col-auto">
							<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> -->

	<div class="row">
		
		<div class="col-xl-12 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total Pendaftar (berdasarkan Unit Bisnis)</div>
							<table class="table">
							<?php 
							if ( isset($total_registrant) and $total_registrant != 0 ) {
								foreach ($total_registrant as $row) {
									?>
									<tr>
										<th><?= $row->participant_unit_bisnis ?></th>
										<td><?= $row->TOTAL ?></td>
									</tr>
									<?php 
								}
							}
							?>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- <div class="col-xl-12 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total Yang Hadir (berdasarkan Unit Bisnis)</div>
							<table class="table">
							<?php 
							if ( isset($total_registrant_attend) and $total_registrant_attend != 0 ) {
								foreach ($total_registrant_attend as $row) {
									?>
									<tr>
										<th><?= $row->participant_unit_bisnis ?></th>
										<td><?= $row->TOTAL ?></td>
									</tr>
									<?php 
								}
							}
							?>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div> -->
	</div>
</div>
<!-- /.container-fluid -->