<?php

namespace App\Http\Controllers;
use App\Models\WaliSantri;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Http\JsonResponse;
use App\Models\User;

class WaliSantriController extends Controller
{
	public function index()
    : JsonResponse {

        $data_wali_santri = WaliSantri::all();
        $data = [];

        foreach ($data_wali_santri as $wali_santri) {
            $data[] = [
                "id" => $wali_santri->id,
                "no_kk" => $wali_santri->no_kk,
                "nama" => $wali_santri->getUser->nama,
                "email" => $wali_santri->getUser->email,
                "no_hp" => $wali_santri->getUser->no_hp,
                "nik" => $wali_santri->nik
            ];
        }

        return response()->json($data);
    }

    public function edit($id)
    : JsonResponse {

        $data_wali_santri = WaliSantri::where("id", $id)->first();
        $data = [];

            $data[] = [
                "id" => $data_wali_santri->id,
                "no_kk" => $data_wali_santri->no_kk,
                "nama" => $data_wali_santri->getUser->nama,
                "email" => $data_wali_santri->getUser->email,
                "no_hp" => $data_wali_santri->getUser->no_hp,
                "nik" => $data_wali_santri->getUser->nik
            ];

        return response()->json($data);
    }

    public function create(Request $request)
    : JsonResponse {

        $user = new User;

        $user->nama = $request->nama;
        $user->email = $request->email;
        $user->password = "wali_santri";
        $user->no_hp = $request->no_hp;
        $user->save();

        $wali_santri = new WaliSantri;

        $wali_santri->id = $user->id;
        $wali_santri->nik = $request->nik;
        $wali_santri->no_kk = $request->no_kk;

        $wali_santri->save();

        return response()->json($wali_santri, Response::HTTP_CREATED);
    }

    public function update($id, Request $request)
    : JsonResponse {

        $user = User::where("id", $id)->update([
            "nama" => $request->nama,
            "email" => $request->email,
            "no_hp" => $request->no_hp
        ]);

        $wali_santri = WaliSantri::where("id", $id)->update([
            "nik" => $request->nik,
            "no_kk" => $request->no_kk
        ]);

        return response()->json($wali_santri, Response::HTTP_OK);
    }

    public function delete($id) {

        User::findOrFail($id)->delete();

        WaliSantri::findOrFail($id)->delete();

        return response('Deleted Successfully', Response::HTTP_OK);
    }
}