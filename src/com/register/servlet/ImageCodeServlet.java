package com.register.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/imagecode")
public class ImageCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ImageCodeServlet() {
		super();
	}

	// ������ͼƬ�ĳ��ﶼ����Java�С�
	private List<String> words = new ArrayList<>();

	@Override
	public void init() throws ServletException {
		// �ļ�new_words.txt��·��
		String path = getServletContext().getRealPath("WEB-INF/new_words.txt");
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new InputStreamReader(
					new FileInputStream(path), "utf-8"));
			String line;
			for (; (line = reader.readLine()) != null;) {
				words.add(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// JavaҪ����һ��ͼƬ,Java AWT��� ���ڴ�����ƵȵȵĹ����ࡣ
		// ���
		Random random = new Random();
		int index = random.nextInt(words.size());
		String word = words.get(index);

		// ��word����session��
		request.getSession().setAttribute("word", word);

		// ������֤��Ŀ��
		int width = 120;
		int height = 30;
		// ˵��ÿһ�����ص㣬����͸���ģ�ֻ��RGB��������
		BufferedImage bufferedImage = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		// ���ƶ���Ҳ������ͼƬ�ϻ����Ķ���
		Graphics graphics = bufferedImage.getGraphics();
		Color color = getRandomColor(200, 240);
		// �ѻ��ƶ���ʹ�õ���ɫ����Ϊcolor
		graphics.setColor(color);
		// ��������ͼƬ������ɫ��Ϊcolor
		graphics.fillRect(0, 0, width, height);
		graphics.setColor(Color.WHITE);
		// ���
		graphics.drawRect(0, 0, width - 1, height - 1);
		// �ڶ�����
		// ��֤�룺
		Graphics2D graphics2d = (Graphics2D) graphics;
		// ��������
		graphics2d.setFont(new Font("����", Font.BOLD, 18));
		int x = 10;
		int y = 20;
		// ����ÿһ���֣���ʵһ����4����
		for (int i = 0; i < word.length(); i++) {
			char c = word.charAt(i);
			// ����һ���Ƚ������ɫ
			graphics2d.setColor(getRandomColor(20, 110));
			// ���Ƶ���������������ŤŤ����
			int angle = random.nextInt(60) - 30;
			// Java�ϵ��ǻ�����
			double theta = Math.PI / 180 * angle;
			// д���֣�����ŤŤ��д
			graphics2d.rotate(theta, x, y);
			// д,��x��y���������дc
			graphics2d.drawString("" + c, x, y);
			// ת����
			graphics2d.rotate(-theta, x, y);
			x += 30;
		}

		// �������֣�
		// ���
		int x1;
		int x2;
		int y1;
		int y2;
		for (int i = 0; i < 30; i++) {
			// �ߵĳ��Ȳ��ᳬ��sqrt(288)��
			// �����ߵķ���ȫ�������ϵ�����
			graphics.setColor(getRandomColor(160, 200));
			x1 = random.nextInt(width);
			y1 = random.nextInt(height);
			x2 = x1 + random.nextInt(12);
			y2 = y1 + random.nextInt(12);
			graphics.drawLine(x1, y1, x2, y2);
		}
		// ���˻�����������ȫ�����
		// �ͷ���Դ
		graphics.dispose();
		// ͨ��response��bufferedImage��jpg��ͼƬ��ʽ���͵��������
		ImageIO.write(bufferedImage, "jpg", response.getOutputStream());
	}

	// ���õ�ʱ��Ҫ��ec>fc
	// ����Ҵ���200,240������õ�һ��ǳ��ɫ
	private Color getRandomColor(int fc, int ec) {
		Random random = new Random();
		int r = random.nextInt(ec - fc) + fc;
		int g = random.nextInt(ec - fc) + fc;
		int b = random.nextInt(ec - fc) + fc;
		return new Color(r, g, b);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
