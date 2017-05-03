<?php

namespace App\Http\Controllers;
use App\Diskusi;
use Illuminate\Http\Request;
class DiskusiController extends Controller
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
        
        $posts=Diskusi::all();
        
        echo json_encode($posts);
        
    }
    
    public function tambah(Request $data){
        $post = new Diskusi;
        $table -> subjek = $data->input('subjek');
        $table -> isi = $data->input('isi');
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
