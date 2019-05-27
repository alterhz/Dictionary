<?php
namespace app\index\controller;

use app\index\model\User;
use app\index\model\Dic;
use app\index\model\Word;

class Edit extends \think\Controller
{
	
	
    public function test3()
    {
        return '<style type="text/css">*{ padding: 0; margin: 0; } .think_default_text{ padding: 4px 48px;} a{color:#2E5CD5;cursor: pointer;text-decoration: none} a:hover{text-decoration:underline; } body{ background: #fff; font-family: "Century Gothic","Microsoft yahei"; color: #333;font-size:18px} h1{ font-size: 100px; font-weight: normal; margin-bottom: 12px; } p{ line-height: 1.6em; font-size: 42px }</style><div style="padding: 24px 48px;"> <h1>:)</h1><p> ThinkPHP V5<br/><span style="font-size:30px">十年磨一剑 - 为API开发设计的高性能框架</span></p><span style="font-size:22px;">[ V5.0 版本由 <a href="http://www.qiniu.com" target="qiniu">七牛云</a> 独家赞助发布 ]</span></div><script type="text/javascript" src="https://tajs.qq.com/stats?sId=9347272" charset="UTF-8"></script><script type="text/javascript" src="https://e.topthink.com/Public/static/client.js"></script><think id="ad_bd568ce7058a1091"></think>';
    }
	
	/**************************************************
	 * 以下需要session检测
	 *************************************************/
	
	/**
	 * session检测
	 */
	protected function checkSession() {
		if (!session('?session_user')) {
			$this->redirect("index/login");
		}
	}
	
	public function index() {
		$this->checkSession();
		
		$searchDic = session("session_user")->search_dic;
		if (strlen($searchDic) == 0) {
			$searchDic = 'LONGMAN';
		}
		
		$dicList = Dic::all();
		$this->assign('dicList', $dicList);
		
		$dic = Dic::get(['name' => $searchDic]);
		$this->assign('dic', $dic);
		
		$userId = session("session_user")->id;
		$wordList = Word::where('user_id', $userId)->where('familar', 1)->order('text')->select();
		$this->assign('wordList', $wordList);
		
		return $this->fetch();
	}
	
	public function getWordList() {
		$this->checkSession();
		
		$userId = session("session_user")->id;
		$wordList = Word::where('user_id', $userId)->order('text')->select();
		
		return json_encode($wordList);
	}
	
	public function markWord() {
		$this->checkSession();
		
		if (input('?text') && input('?familar')) {
			$userId = session("session_user")->id;
			$text = input('text');
			$familar = input('familar');
			
			$text = strtolower(trim($text));

			$word = Word::where('user_id', $userId)->where('text', $text)->find();
			if (null == $word) {
				$word = new Word;
				$word->user_id = $userId;
				$word->text = $text;
				$word->familar = $familar;

				$inserCount = $word->allowField(['user_id', 'text', 'familar'])->save();
			} else {
				$word->familar = $familar;
				$inserCount = $word->allowField(['familar'])->save();
			}
		} 
		
		return "OK";
	}
	
	public function changeDic() {
		$this->checkSession();
		
		if (input('?name')) {
			$name = input('name');
			if (strlen($name) > 0) {
				$session_user = session("session_user");
				$session_user->search_dic = $name;
				$session_user->allowField(['search_dic', 'update_time'])->save();
			}
		}
		
		return "OK";
	}
	
}
