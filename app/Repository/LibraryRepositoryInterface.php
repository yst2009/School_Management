<?php

namespace App\Repository;

interface LibraryRepositoryInterface
{
    public function index();

    public function create();

    public function store($request);

    public function destroy($request);

    public function download($filename);
}