<?php

use yii\widgets\LinkPager;
use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = 'Homepage';
?>
<div class="site-index">

    <?php if (Yii::$app->getRequest()->getQueryParam('page') <= 1) : ?>
        <div class="jumbotron">
            <h1>Welcome to Yii Framework Indonesia</h1>

            <p class="lead">Selamat datang di web resmi komunitas Yii Framework Indonesia!!!..</p>

            <p><a class="btn btn-lg btn-success" href="http://www.yiiframework.id">Get started with Yii</a></p>
        </div>
    <?php endif; ?>

    <div class="body-content">

        <?php /* @var $post yeesoft\post\models\Post */ ?>
        <?php foreach ($posts as $post) : ?>
            <div class="post clearfix">
                <h2>
                    <a href="<?= Url::to(["/site/{$post->slug}"]) ?>">
                        <?= $post->title ?>
                    </a>
                </h2>

                <p class="text-justify">
                    <?= $post->getThumbnail(['class' => 'thumbnail pull-left', 'style' => 'width: 160px; margin: 0 7px 7px 0']) ?>
                    <?= $post->shortContent ?>
                </p>
                <div class="clearfix"></div>
                <?php if($post->category): ?>
                    <?= Yii::t('yee/post', 'Posted in')?> <a href="<?= Url::to(['/category/index', 'slug' => $post->category->slug]) ?>">"<?= $post->category->title ?>"</a>
                <?php endif; ?>
                <span class="pull-right"><?= Yii::t('yee', 'Published') ?> <b><?= $post->publishedDate ?></b></span>

            </div>
        <?php endforeach; ?>

        <div class="text-center">
            <?= LinkPager::widget(['pagination' => $pagination]) ?>
        </div>

    </div>
</div>
