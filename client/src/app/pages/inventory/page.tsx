import React from 'react'
import {
    Table,
    TableBody,
    TableCaption,
    TableCell,
    TableFooter,
    TableHead,
    TableHeader,
    TableRow,
  } from "@/components/ui/table"
import { Button } from "@/components/ui/button"
import { Card,CardContent } from '@/components/ui/card'
import  Link  from "next/link"

export default function inventory() {
  
    const invoices = [
        {
          invoice: "INV001",
          paymentStatus: "Paid",
          totalAmount: "$250.00",
          paymentMethod: "Credit Card",
        },
        {
          invoice: "INV002",
          paymentStatus: "Pending",
          totalAmount: "$150.00",
          paymentMethod: "PayPal",
        },
        {
          invoice: "INV003",
          paymentStatus: "Unpaid",
          totalAmount: "$350.00",
          paymentMethod: "Bank Transfer",
        },
        {
          invoice: "INV004",
          paymentStatus: "Paid",
          totalAmount: "$450.00",
          paymentMethod: "Credit Card",
        },
        {
          invoice: "INV005",
          paymentStatus: "Paid",
          totalAmount: "$550.00",
          paymentMethod: "PayPal",
        },
        {
          invoice: "INV006",
          paymentStatus: "Pending",
          totalAmount: "$200.00",
          paymentMethod: "Bank Transfer",
        },
        {
          invoice: "INV007",
          paymentStatus: "Unpaid",
          totalAmount: "$300.00",
          paymentMethod: "Credit Card",
        },
      ]
  return (<>
    <div className='flex justify-between gap-4'>
    <Card className='w-full'>
      <CardContent >
        <h1 className="text-2xl font-semibold ">manuelito se la come</h1>
      </CardContent>
    </Card>
    <Card  className='w-full'>
      <CardContent >
        <h1 className="text-2xl font-semibold ">On Sale</h1>
      </CardContent>
    </Card>
    <Card  className='w-full'>
      <CardContent >
        <h1 className="text-2xl font-semibold ">Blocked</h1>
      </CardContent>
    </Card>
    </div>
    
    <Link href='/pages/inventory/add'><Button > Add Product</Button></Link>

    <Table>
        <TableCaption>A list of your recent invoices.</TableCaption>
        <TableHeader>
          <TableRow>
            <TableHead>Code</TableHead>
            <TableHead>Product</TableHead>
            <TableHead>Thumbnail</TableHead>
            <TableHead>Stock</TableHead>
            <TableHead>Minimun Price</TableHead>
            <TableHead>Sale Price</TableHead>
          </TableRow>
        </TableHeader>
        <TableBody>
          {invoices.map((invoice) => (
            <TableRow key={invoice.invoice}>
              <TableCell className="font-medium">{invoice.invoice}</TableCell>
              <TableCell>{invoice.paymentStatus}</TableCell>
              <TableCell>{invoice.paymentMethod}</TableCell>
              <TableCell className="text-right">{invoice.totalAmount}</TableCell>
            </TableRow>
          ))}
        </TableBody>
        <TableFooter>
          <TableRow>
            <TableCell colSpan={3}>Total</TableCell>
            <TableCell className="text-right">$2,500.00</TableCell>
          </TableRow>
        </TableFooter>
      </Table>
  </>
  )
}
