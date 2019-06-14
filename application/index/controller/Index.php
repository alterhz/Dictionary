<?php
namespace app\index\controller;

use app\index\model\User;
use app\index\model\Search;
use app\index\model\Dic;

class Index extends \think\Controller
{
	public function register() {
		if (input('?name') && input('?password')) 
		{
			$name = input('name');
			$password = input('password');
			
			if (strlen($name) < 3) {
				return $this->error("account is too short.");
			}
			
			if (strlen($password) < 6) {
				return $this->error("password is too short.");
			}
			
			$user = User::getByName($name);
			if (null == $user) {
				$user = new User();
				$user->name = $name;
				$user->password = $password;
				$inserCount = $user->allowField(['name', 'password', 'create_time'])->save();
				if ($inserCount == 0) {
					// 创建失败
					return $this->error("register failed.");
				} else {
					return $this->success("register Success.", "index/login");
				}
			} else {
				return $this->error("account is exist.");
			}
		}
		else 
		{
			return $this->fetch();
		}
	}
	
	/**
	 * login
	 */
	public function login() {
		if (input('?name') && input('?password')) 
		{
			echo "ddd";
			$name = input('name');
			$password = input('password');
			
			if (strlen($name) < 3) {
				return $this->error("account is too short.");
			}
			
			if (strlen($password) < 6) {
				return $this->error("password is too short.");
			}
			
			$user = User::getByName($name);
			if (null == $user) {
				return $this->error("account is invalid.");
			}
			
			if (strcasecmp($user->password, $password) == 0) {
				// 密码正确
				session("session_user", $user);
				echo "ddd";
				return $this->redirect("index/index");
			} else {
				return $this->error("password is invalid.");
			}
		} 
		else 
		{
			return $this->fetch();
		}
	}
	
	/**
	 * logout
	 */
	public function logout() {
		session("session_user", null);
		return $this->redirect("index/login");
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
		
		$userId = session("session_user")->id;
		$maxHistoryCount = session("session_user")->history_count;
		$maxTopCount = session("session_user")->top_count;
		
		if ($maxHistoryCount < 5) {
			$maxHistoryCount = 5;
		}
		
		if ($maxTopCount < 5) {
			$maxTopCount = 5;
		}
		
		$searchDic = session("session_user")->search_dic;
		if (strlen($searchDic) == 0) {
			$searchDic = 'LONGMAN';
		}
		
		$wordCount = Search::where('user_id', $userId)->count();
		$searchCount = Search::where('user_id', $userId)->sum('search_count');
		
		$dicList = Dic::all();
		
		$dic = Dic::get(['name' => $searchDic]);

		$historyList = Search::where('user_id', $userId)->order('update_time desc')->limit($maxHistoryCount)->select();

		$topList = Search::where('user_id', $userId)->order('search_count desc')->limit($maxTopCount)->select();
		
		// assign list
		$this->assign('wordCount', $wordCount);
		$this->assign('searchCount', $searchCount);
		
		$this->assign('dicList', $dicList);
		$this->assign('dic', $dic);
		
		$this->assign('historyList', $historyList);
		$this->assign('topList', $topList);

		//$this->assign('maxHistoryCount', $maxHistoryCount);
		
		return $this->fetch();
	}
	
	public function history() {
		$this->checkSession();
		
		$userId = session("session_user")->id;
		$maxHistoryCount = session("session_user")->history_count;
		$maxTopCount = session("session_user")->top_count;
		
		if ($maxHistoryCount < 5) {
			$maxHistoryCount = 5;
		}
		
		if ($maxTopCount < 5) {
			$maxTopCount = 5;
		}
		
		$searchDic = session("session_user")->search_dic;
		if (strlen($searchDic) == 0) {
			$searchDic = 'LONGMAN';
		}
		
		$wordCount = Search::where('user_id', $userId)->count();
		$searchCount = Search::where('user_id', $userId)->sum('search_count');
		
		$dicList = Dic::all();
		
		$dic = Dic::get(['name' => $searchDic]);

		$historyList = Search::where('user_id', $userId)->order('update_time desc')->select();

		$topList = Search::where('user_id', $userId)->order('search_count desc')->limit($maxTopCount)->select();
		
		// assign list
		$this->assign('wordCount', $wordCount);
		$this->assign('searchCount', $searchCount);
		
		$this->assign('dicList', $dicList);
		$this->assign('dic', $dic);
		
		$this->assign('historyList', $historyList);
		$this->assign('topList', $topList);

		//$this->assign('maxHistoryCount', $maxHistoryCount);
		
		return $this->fetch();
	}
	
	public function search() {
		$this->checkSession();
		
		if (input('?text')) {
			$user_id = session("session_user")->id;
			$text = input('text');
			$text = trim($text);
			$text = strtolower($text);
			if (strlen($text) > 0) {
				$search = Search::where('user_id', $user_id)->where('text', $text)->find();
				if (null == $search) {
					$search = new Search;
					$search->user_id = $user_id;
					$search->text = $text;

					$inserCount = $search->allowField(['user_id', 'text'])->save();

				} else {
					$search->search_count = $search->search_count + 1;
					$inserCount = $search->allowField(['search_count'])->save();
				}
			}
		}
		
		return "ok";
	}
	
	public function delete() {
		$this->checkSession();
		
		if (input('?text')) {
			$user_id = session("session_user")->id;
			$text = input('text');
			if (strlen($text) > 0) {
				$count = Search::where('user_id', $user_id)->where('text', $text)->delete();
			}
		}
		
		return "ok";
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
	
	public function changeHistoryCount() {
		$this->checkSession();
		
		if (input('?count')) {
			$count = input('count');
			if ($count >= 5) {
				$session_user = session("session_user");
				$session_user->history_count = $count;
				$session_user->allowField(['history_count', 'update_time'])->save();
			}
		}
		
		return $this->redirect('index/index');
	} 

	public function changeTopCount() {
		$this->checkSession();
		
		if (input('?count')) {
			$count = input('count');
			if ($count >= 5) {
				$session_user = session("session_user");
				$session_user->top_count = $count;
				$session_user->allowField(['top_count', 'update_time'])->save();
			}
		}
		
		return $this->redirect('index/index');
	} 
	
   
	
}
