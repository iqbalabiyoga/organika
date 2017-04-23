<?php

namespace App\Http\Controllers;
use App\Pengguna;
use Illuminate\Http\Request;
class PenggunaController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function index(){
        
        $nama=Pengguna::all();
        
        echo json_encode($nama);
        
    }
    
    public function tambah(Request $data){
        $table = new Pengguna;
        $table -> nama = $data->input('nama');
        $table -> email = $data->input('email');
        $table -> password = $data->input('password');
        echo $table;
        $table->save();
    }
    
    public function edit(Request $data){
        $update= Pengguna::find($data->input('id_pengguna'));
         
        $update->nama=$data->input('nama');
        $update->email=$data->input('email');
        $update->password=$data->input('password');
  
        $update->save();
         echo $update;
    }
    
    public function delete(Request $id){
        Pengguna::where('id_pengguna',$id->input('id_pengguna'))->delete();
    }
    //
}
