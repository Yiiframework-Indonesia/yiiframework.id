<?php

namespace frontend\components;

/**
 *
 * @inheritdoc
 */
class Theme extends \yii\base\Theme
{
    /**
     * Theme folder name
     *
     * @var string
     */
    public $theme;

    public function init()
    {
        parent::init();

        if (!isset($this->theme)) {
            $this->theme = 'default';
        }

        $this->basePath = '@app/themes/' . $this->theme . '/web';
        $this->baseUrl = '@web/themes/' . $this->theme . '/web';
        $this->pathMap = [
            '@frontend/views' => '@app/themes/' . $this->theme . '/views',
        ];
    }
}