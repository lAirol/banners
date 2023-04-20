<script type="text/javascript" src="{$path_host}scripts/admin/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="{$path_host}scripts/admin/jquery-ui-1.8.16.custom.min.js"></script>
<h3>
    {if $add_banner}
        Добавление баннера
        {assign var='required' value='required'}
    {else}
        Редактирование баннера
        {assign var='required' value=''}
    {/if}
</h3>
	{if $error2}<p>{$error2}</p>{/if}
	<form action='/admin_mimagelb/changeBanners/0'{$id} method='post' enctype='multipart/form-data'>
		<table>
		<tr>
			<td width='100'>Заголовок<span class="red_point">*</span>:</td>
			<td><input type='text' name='title' size='50' value='{$mimagelb.title}' required/></td>
		</tr>
		{if $image_mimagelb}
		<tr>
			<td width='100'>Файл<span class="red_point">*</span>:</td>
			<td>
                            {if $image_mimagelb eq 1}
				{if $mimagelb.image_name and $item.is_flash eq 0}
					<br/><img src="/{$img_path}{$mimagelb.image_name}" border="1"/>
					{if $banner_hover and $mimagelb.image_h_name}&nbsp;&nbsp;<img src="/{$img_path}{$mimagelb.image_h_name}" border="1"/>{/if}
				{elseif $mimagelb.image_name and $item.is_flash eq 1}
					<br/>
                    <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" id="{$item.image_name}" align="middle">
						<param name="allowScriptAccess" value="sameDomain" />
						<param name="movie" value="{$mimagelb.image_name}" />
						<param name="quality" value="high" />
						<param name="bgcolor" value="#ffffff" />
						<embed src="/{$img_path}{$mimagelb.image_name}" quality="high" bgcolor="#ffffff" name="{$mimagelb.image_name}" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
					</object>
				{elseif $mimagelb.flash_code}
					<br/>{$mimagelb.flash_code}
				{/if}
                            {/if}
                            <input type='file' name='image' size='51' id="input_file" onChange="filterImage('input_file')" {$required} />
                        </td>
                           {else}
                               <td width='100'>Файл<span class="red_point"></span>:</td>
			<td>
                            {if $image_mimagelb eq 0}
				{if $mimagelb.image_name and $item.is_flash eq 0}
					<br/><img src="/{$img_path}{$mimagelb.image_name}" border="1"/>
					{if $banner_hover and $mimagelb.image_h_name}&nbsp;&nbsp;<img src="/{$img_path}{$mimagelb.image_h_name}" border="1"/>{/if}
				{elseif $mimagelb.image_name and $item.is_flash eq 1}
					<br/>
                    <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" id="{$item.image_name}" align="middle">
						<param name="allowScriptAccess" value="sameDomain" />
						<param name="movie" value="{$mimagelb.image_name}" />
						<param name="quality" value="high" />
						<param name="bgcolor" value="#ffffff" />
						<embed src="/{$img_path}{$mimagelb.image_name}" quality="high" bgcolor="#ffffff" name="{$mimagelb.image_name}" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
					</object>
				{elseif $mimagelb.flash_code}
					<br/>{$mimagelb.flash_code}
				{/if}
                            {/if} 
                            <input type='file' name='image' size='51' id="input_file" onChange="filterImage('input_file')" />     
                        </td> 
		</tr>
		{/if}
                
		{if $banner_hover}
		<tr>
			<td width='100'>при наведении<span class="red_point">*</span>:</td>
			<td><input type='file' name='image_h' id="input_file_h" size='51' {$required} onChange="filterImage('input_file_h')" /></td>
		</tr>
		<tr>
			<td width='100'><input type='hidden' name='image_h_name' value='{$mimagelb.image_h_name}'/></td>
			<td style='padding:5px 0px 10px;'>{if $mimagelb.image_h_name}<img src='/{$img_path}{$mimagelb.image_h_name}' border='0'/>{/if}</td>
		</tr>
		{/if}
		<tr>
			<td width='100'>URL<span class="red_point"></span>:</td>
                        <td><input type='text' name='url' size='50' value="{$mimagelb.url}" id='url'/></td>
		</tr>
                <tr>
			<td>Краткое описание:</td>
			<td>{if $additionalOptions.shortTextF}
					{$short_text->show()}
				{else}
					<textarea name='short_text' cols='80' rows='10'>{$mimagelb.short_text}</textarea>
				{/if}</td>
		</tr>
		<tr >
			<td>Описание:</td>
			<td style="margin-top:20px;">
			{if $additionalOptions.textF}
					{$text->show()}
				{else}
					<textarea name='text' cols='80' rows='10'>{$mimagelb.text}</textarea>
				{/if}</td>
		</tr>
                {if @in_array('mimagelb_change_active',$acl)}
                    <tr>
                            <td width='100'></td>
                            <td><input type='checkbox' name='active' {if $mimagelb.active eq 1}checked{/if}/>Активный элемент</td>
                    </tr>
                {/if}
		<tr>
			<td width='100'></td>
			<td><input type='checkbox' name='nofollow' {if $mimagelb.nofollow eq 1}checked{/if} value='{$mimagelb.nofollow}'/>Установить для баннера свойство nofollow</td>
		</tr>
		<tr>
			<td width='100'>Сортировка:</td>
			<td><input type='text' name='sort' size='6' value='{$mimagelb.sort}' maxlength='10'/></td>
		</tr>
		<tr>
			<td width='100'>target:</td>
			<td>
				<select name='target'>
					<option value='_blank' {if $mimagelb.target eq "_blank"}selected{/if}>_blank</option>
					<option value='_self' {if $mimagelb.target eq "_self"}selected{/if}>_self</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width='100'></td>
			<td><input type='checkbox' name='show_in_list' {if ($mimagelb.show_in_list eq 1) || $add_banner}checked{/if}/>Отображать в списке баннеров-ссылок </td>
		</tr>
		</table>
		<input type='submit' name='save' value='Сохранить'/>
                <input type='hidden' name='id' value='{$id}' />
                <input type='hidden' name='max_size' id='max_size' value={$max_size} />
	</form>
	
	<div style='padding-top:30px;'><span class="red_point">*</span> - обязательные для заполнения поля</div>
