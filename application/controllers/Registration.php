<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Registration extends MY_Controller {

	public function index(){

		$this->load->view('registration/index');
	}

	public function registered($id)
	{
		$data['participant'] = $this->sitemodel->view('view_registration', '*', ['registration_id'=>$id]);
		$this->load->view('registration/registered', $data);
	}

	public function save()
	{
		// echo json_encode($this->input->post());die;
		/*** Check POST or GET ***/
		if ( !$_POST ){$this->response['msg'] = "Invalid parameters.";echo json_encode($this->response);exit;}

		$participant_name 			= $this->input->post('participant_name');
		$participant_email 			= $this->input->post('participant_email');
		$participant_wa 			= $this->input->post('participant_wa');
		// $participant_birth_place 	= $this->input->post('participant_birth_place');
		// $participant_birth_date 	= $this->input->post('participant_birth_date');
		$participant_nip 			= $this->input->post('participant_nip');
		// $participant_nik 			= $this->input->post('participant_nik');
		// $participant_gender 		= $this->input->post('participant_gender');
		// $participant_addr 			= $this->input->post('participant_addr');
		$participant_unit_bisnis 	= $this->input->post('participant_unit_bisnis');
		$participant_divisi 		= $this->input->post('participant_divisi');
		// $participant_department 	= $this->input->post('participant_department');
		// $participant_keberangkatan 	= $this->input->post('participant_keberangkatan');

		$check_nip = $this->sitemodel->view('view_participants', '*', ['participant_nip'=>$participant_nip]);
		if ($check_nip) {$this->response['msg'] = "Anda telah melakukan pendaftaran !";echo json_encode($this->response);exit;}

		$data = [
			'participant_name'			=> $participant_name,
			'participant_email'			=> $participant_email,
			'participant_wa'			=> $participant_wa,
			// 'participant_birth_place'	=> $participant_birth_place,
			// 'participant_birth_date'	=> $participant_birth_date,
			'participant_nip'			=> $participant_nip,
			// 'participant_nik'			=> $participant_nik,
			// 'participant_gender'		=> $participant_gender,
			// 'participant_addr'			=> $participant_addr,
			'participant_unit_bisnis'	=> $participant_unit_bisnis,
			'participant_divisi'		=> $participant_divisi,
			// 'participant_department'	=> $participant_department,
			// 'participant_keberangkatan'	=> $participant_keberangkatan,
			'addon'						=> date('Y-m-d H:i:s'),
		];

		$target_dir = 'assets/public/registran/'.$participant_nip.'/';
		$participant_qr = md5($participant_nip).".png";
		$data['participant_qr'] = $participant_qr;
		$files = $target_dir.$participant_qr;
		
		if (!file_exists($target_dir)) {
			mkdir($target_dir, 0777, true);
		}

		$this->load->library('phpqrcode');
		$qr = $this->phpqrcode->generate($participant_nip, $target_dir.$participant_qr);

		$insert = $this->sitemodel->insert('tab_participants', $data);


		$data_registration = [
			'participant_id' => $insert,
			'is_antigen'	 => 0,
			'is_verify'		 => 0,
			'addon'			 => date('Y-m-d H:i:s'),
			'modion'		 => date('Y-m-d H:i:s'),
		];
		
		$registration = $this->sitemodel->insert('tr_registration', $data_registration);

		# send email
		$subject = 'Registrasi Papandayan Jazz Festival';
		$data_email['email']['content'] = $this->sitemodel->view('view_registration', '*', ['registration_id'=>$registration]);
		$data_email['page'] = 'registration';
		$content = $this->load->view('emails/template', $data_email, true);

		$isSent = sendEmail($participant_email, $subject, $content, "Pendaftaran Papandayan Jazz Festival", $files);
		
		if (! $isSent) {
			$this->response['msg'] = "Oops, we failed to send an email to." . $participant_email;
		}

		/*** Result Area ***/
		$this->response['type'] = 'done';
		$this->response['id'] = $registration;
		echo json_encode($this->response);
		exit;
	}
}
