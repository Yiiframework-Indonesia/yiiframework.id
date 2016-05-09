<?php
/* @var $this \yii\web\View */
/* @var $content string */

use common\widgets\Alert;
use frontend\assets\AppAsset;
use frontend\assets\ThemeAsset;
use yeesoft\models\Menu;
use yeesoft\widgets\LanguageSelector;
use yeesoft\widgets\Nav as Navigation;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\helpers\Html;
use yii\widgets\Breadcrumbs;

Yii::$app->assetManager->forceCopy = true;
AppAsset::register($this);
ThemeAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <?= $this->renderMetaTags() ?>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    <?php
    NavBar::begin([
        'brandLabel' => Yii::$app->settings->get('general.title', 'Yii Framework Indonesia', Yii::$app->language),
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-default navbar-fixed-top',
        ],
    ]);
    $menuItems = Menu::getMenuItems('main-menu');
    if (Yii::$app->user->isGuest) {
        $menuItems[] = ['label' => Yii::t('yee/auth', 'Signup'), 'url' => \yii\helpers\Url::to(['/auth/default/signup'])];
        $menuItems[] = ['label' => Yii::t('yee/auth', 'Login'), 'url' => ['/auth/default/login']];
    } else {
        $menuItems[] = [
            'label' => Yii::$app->user->identity->username,
            'url' => ['/auth/default/profile'],
        ];

        $menuItems[] = [
            'label' => Yii::t('yee/auth', 'Logout'),
            'url' => ['/auth/default/logout', 'language' => false],
            'linkOptions' => ['data-method' => 'post']
        ];
    }
    echo Nav::widget([
        'encodeLabels' => false,
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => $menuItems,
    ]);

    echo LanguageSelector::widget(['display' => 'label', 'view' => 'pills']);

    NavBar::end();
    ?>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <?= Breadcrumbs::widget(['links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : []]) ?>
                <?= Alert::widget() ?>
                <?= $content ?>
            </div>
        </div>
    </div>
</div>

<footer id="footer">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-6 footerleft ">
				<div class="logofooter"><?=Html::img('@web/img/yii_logo.png', ['width'=>'180px','alt'=>Yii::$app->settings->get('general.title', 'Yii Framework Indonesia', Yii::$app->language)])?></div>
				<p>Yii is a free, open-source Web application development framework written in PHP5 that promotes clean, DRY design and encourages rapid development. It works to streamline your application development and helps to ensure an extremely efficient, extensible, and maintainable end product.</p>
				<p><i class="fa fa-phone"></i> Phone (Indonesia) : +62 xxxx xxxx xxxx</p>
				<p><i class="fa fa-envelope"></i> E-mail : info@yiiframework.id</p>
			</div>
			<div class="col-md-2 col-sm-6 paddingtop-bottom">
				<h6 class="heading7"><i class="fa fa-sitemap"></i> MENU</h6>
				<ul class="footer-ul">
					<li><a href="#"> Home</a></li>
					<li><a href="#"> About</a></li>
					<li><a href="#"> Tutorial</a></li>
					<li><a href="#"> Case Studies</a></li>
					<li><a href="#"> Career</a></li>
					<li><a href="#"> Privacy Policy</a></li>
					<li><a href="#"> Frequently Ask Questions</a></li>
				</ul>
			</div>
			<div class="col-md-3 col-sm-6 paddingtop-bottom">
				<h6 class="heading7"><i class="fa fa-newspaper-o"></i> LATEST POST</h6>
				<div class="footer-post">
					<p><a href="#">Menampilkan Data Relasi di Gridview Yii2</a> <span>May 14,2016</span></p>
					<p><a href="#">Ajax Search di Gridview Yii2</a> <span>May 14,2016</span></p>
					<p><a href="#">Upload File di Yii2</a> <span>May 14,2016</span></p>
					<p><a href="#">Memahami Relasi Antar Tabel di Yii Active Record</a> <span>May 14,2016</span></p>
				</div>
			</div>
			<div class="col-md-3 col-sm-6 paddingtop-bottom">
				<div class="fb-page" data-href="https://www.facebook.com/groups/yii.indonesia/" data-tabs="timeline" data-height="300" data-small-header="false" style="margin-bottom:15px;" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
					<div class="fb-xfbml-parse-ignore">
						<blockquote cite="https://www.facebook.com/groups/yii.indonesia/"><a href="https://www.facebook.com/groups/yii.indonesia/">Facebook</a></blockquote>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>

<div class="copyright">
	<div class="container">
		<div class="col-md-6">
			<p>&copy; <?= Html::encode(Yii::$app->settings->get('general.title', 'Yee Site', Yii::$app->language)) ?> <?= date('Y') ?> - All Rights with reserved</p>	
		</div>
		<div class="col-md-6">
			<p class="pull-right"><?= Yii::powered() ?>, <?= yeesoft\Yee::powered() ?></p>
		</div>
	</div>
</div>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
