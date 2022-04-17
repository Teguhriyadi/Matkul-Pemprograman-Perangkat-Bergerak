<?php

namespace App\Http\Controllers;
use App\Models\WaliSantri;

class ExampleController extends Controller
{
	public function index()
    : JsonResponse {

        return response()->json(WaliSantri::all());
    }

    public function edit($id)
    : JsonResponse {

        return response()->json(WaliSantri::find($id));
    }

    public function create(Request $request)
    : JsonResponse {

        $this->validate($request, [
            'name' => 'required',
            'email' => 'required|email|unique:authors',
            'location' => 'required|alpha'
        ]);

        $author = WaliSantri::create($request->all());

        return response()->json($author, Response::HTTP_CREATED);
    }

    public function update($id, Request $request)
    : JsonResponse {

        $author = WaliSantri::findOrFail($id);
        $author->update($request->all());

        return response()->json($author, Response::HTTP_OK);
    }

    public function delete($id) {

        WaliSantri::findOrFail($id)->delete();

        return response('Deleted Successfully', Response::HTTP_OK);
    }
}
