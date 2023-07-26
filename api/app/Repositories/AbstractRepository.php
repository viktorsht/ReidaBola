<?php

    namespace App\Repositories;
    use Illuminate\Database\Eloquent\Model;

    abstract class AbstractRepository{

        protected $model;

        public function __construct(Model $model)
        {
            $this->model = $model;
        }

        public function selectAttributesRelated($att){
            $this->model = $this->model->with($att);
        }

        // me function filter
        // public function filter($filters){
        //     $filters = explode(';', $filters);
        
        //     foreach ($filters as $filter) {
        //         $f = explode(':', $filter);

        //         if (str_contains($f[0], '.')) {
                    
        //             $relationFilter = explode('.', $f[0]);

        //             if (str_contains($relationFilter[0], '|')) {
        //                 // realcioanemno de relacionamento
        //                 $dephRelationFilter = explode( '|', $relationFilter[0] );
        //                 $deph = count($dephRelationFilter);

        //                 // print_r($dephRelationFilter);
        //                 // print($deph);

        //                 if($deph === 2){
        //                     $this->model = $this->model->whereHas( $dephRelationFilter[0], function ($query) use($f, $relationFilter, $dephRelationFilter) {
        //                         $query->whereHas($dephRelationFilter[1], function($query) use ($f, $relationFilter, $dephRelationFilter){
        //                             $query->where($relationFilter[1], $f[1], $f[2] );
        //                         });
        //                     });
        //                 }else if($deph === 3){
        //                     $this->model = $this->model->whereHas( $dephRelationFilter[0], function ($query) use($f, $relationFilter, $dephRelationFilter) {
        //                         $query->whereHas($dephRelationFilter[1], function($query) use ($f, $relationFilter, $dephRelationFilter){

        //                             $query->whereHas($dephRelationFilter[2], function($query) use ($f, $relationFilter, $dephRelationFilter){
        //                                 $query->where($relationFilter[1], $f[1], $f[2] );
        //                             });
        //                         });
        //                     });
        //                 }

                    
        //             }else{
        //                 // relacionaemnto simples
        //                 $this->model = $this->model->whereHas($relationFilter[0], function ($query) use ($relationFilter, $f) {
        //                     $query->where($relationFilter[1], $f[1], $f[2]);
        //                 });
        //             }


        //         }else{
        //             // sem realcioanemnto
        //             $this->model = $this->model->where($f[0], $f[1], $f[2]);
        //         }

        //     }

        // }

        public function filter($filters)
        {
            $filters = explode(';', $filters);

            foreach ($filters as $filter) {
                $f = explode(':', $filter);

                if (str_contains($f[0], '.')) {
                    $relationFilter = explode('.', $f[0]);

                    if (str_contains($relationFilter[0], '|')) {
                        // Relacionamento de relacionamento
                        $dephRelationFilter = explode('|', $relationFilter[0]);
                        $this->model = $this->applyRecursiveWhereHas($this->model, $dephRelationFilter, $relationFilter, $f);
                    } else {
                        // Relacionamento simples
                        $this->model = $this->model->whereHas($relationFilter[0], function ($query) use ($relationFilter, $f) {
                            $query->where($relationFilter[1], $f[1], $f[2]);
                        });
                    }
                } else {
                    // Sem relacionamento
                    $this->model = $this->model->where($f[0], $f[1], $f[2]);
                }
            }
        }

        private function applyRecursiveWhereHas($model, $dephRelationFilter, $relationFilter, $f)
        {
            $relation = array_shift($dephRelationFilter);

            $model = $model->whereHas($relation, function ($query) use ($dephRelationFilter, $relationFilter, $f) {
                if (count($dephRelationFilter) > 0) {
                    // Chamada recursiva para o próximo nível de relacionamento
                    $this->applyRecursiveWhereHas($query, $dephRelationFilter, $relationFilter, $f);
                } else {
                    // Último nível - aplicar o filtro
                    $query->where($relationFilter[1], $f[1], $f[2]);
                }
            });

            return $model;
        }

        public function selectAttributes($attributes){
            $this->model = $this->model->selectRaw($attributes);
        }

        public function getResult(){
            return $this->model->get();
        }

    }

?>

