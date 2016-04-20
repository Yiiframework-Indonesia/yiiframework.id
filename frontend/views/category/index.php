<?php

use yii\widgets\LinkPager;
use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = $category->title;
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="category-index">

    <div class="body-content">

        <h2><?= $category->title ?></h2>

        <?php /* @var $post yeesoft\post\models\Post */ ?>
        <?php foreach ($posts as $post) : ?>
            <div class="post clearfix">
                <h3>
                    <a href="<?= Url::to(["/site/{$post->slug}"]) ?>">
                        <?= $post->title ?>
                    </a>
                </h3>

                <p class="text-justify">
                    <?= $post->getThumbnail(['class' => 'thumbnail pull-left', 'style' => 'width: 160px; margin: 0 7px 7px 0']) ?>
                    <?= $post->shortContent ?>
                </p>
                <div class="clearfix"></div>
                <span class="pull-right"><?= Yii::t('yee', 'Published') ?> <b><?= $post->publishedDate ?></b></span>

            </div>
        <?php endforeach; ?>

        <div class="text-center">
            <?= LinkPager::widget(['pagination' => $pagination]) ?>
        </div>

    </div>
</div>
